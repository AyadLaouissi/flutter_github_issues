part of 'issues_bloc.dart';

abstract class IssuesEvent extends Equatable {
  const IssuesEvent();

  @override
  List<Object> get props => [];
}

class LoadIssues extends IssuesEvent {

  final StateType stateType;
  final SortType sortType;

  const LoadIssues({this.stateType, this.sortType,});

  @override
  List<Object> get props => [this.stateType, this.sortType];
}

class LoadMore extends IssuesEvent {}