import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_media_markt/data/models/issues_model.dart';
import 'package:flutter_media_markt/domain/entities/app_error.dart';
import 'package:flutter_media_markt/domain/entities/page_params.dart';
import 'package:flutter_media_markt/domain/usecases/get_issues.dart';
import 'package:rxdart/rxdart.dart';

part 'issues_event.dart';
part 'issues_state.dart';

class IssuesBloc extends Bloc<IssuesEvent, IssuesState> {
  final GetIssues _getIssues;

  IssuesBloc(this._getIssues) : super(IssuesInitial());

  @override
  Stream<IssuesState> mapEventToState(
    IssuesEvent event,
  ) async* {
    final currentState = state;

    if (event is LoadIssues) {

      if (currentState is IssuesLoadedState || currentState is IssuesErrorState) {
        yield IssuesInitial();
      }

      final issues = await this._getIssues(
        PageParams(
          stateType: event.stateType,
          sortType: event.sortType,
        ),
      );
      yield issues.fold(
            (l) => IssuesErrorState(l),
            (r) => IssuesLoadedState(
          issues: r,
          stateType: event.stateType,
          sortType: event.sortType,
          hasReachedMax: false,
        ),
      );

    } else if (event is LoadMore &&
        !this._hasReachedMax(currentState) &&
        currentState is IssuesLoadedState) {
      final issues = await this._getIssues(
        PageParams(
          stateType: currentState.stateType,
          sortType: currentState.sortType,
          page: currentState.issues.length,
        ),
      );
      yield issues.fold(
        (l) => IssuesErrorState(l),
        (r) => r.isEmpty
            ? currentState.copyWith(hasReachedMax: true)
            : currentState.copyWith(
                issues: currentState.issues + r,
              ),
      );
    }
  }

  bool _hasReachedMax(IssuesState issuesState) =>
      issuesState is IssuesLoadedState && issuesState.hasReachedMax;

  @override
  Stream<Transition<IssuesEvent, IssuesState>> transformEvents(
      Stream<IssuesEvent> events, transitionFn) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }
}
