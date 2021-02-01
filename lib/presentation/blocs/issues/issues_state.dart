part of 'issues_bloc.dart';

abstract class IssuesState extends Equatable {
  const IssuesState();

  @override
  List<Object> get props => [];
}

class IssuesInitial extends IssuesState {}

class IssuesErrorState extends IssuesState {
  final AppError appError;

  const IssuesErrorState(this.appError);

  @override
  List<Object> get props => [this.appError];
}

class IssuesLoadedState extends IssuesState {
  final List<IssuesModel> issues;
  final bool hasReachedMax;
  final StateType stateType;
  final SortType sortType;

  const IssuesLoadedState({
    @required this.issues,
    @required this.hasReachedMax,
    @required this.stateType,
    @required this.sortType,
  });

  IssuesLoadedState copyWith({
    List<IssuesModel> issues,
    bool hasReachedMax,
    StateType stateType,
    SortType sortType,
  }) {
    return IssuesLoadedState(
      issues: issues ?? this.issues,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      stateType: stateType ?? this.stateType,
      sortType: sortType ?? this.sortType,
    );
  }

  @override
  List<Object> get props => [
        this.issues,
        this.hasReachedMax,
        this.stateType,
        this.sortType,
      ];
}
