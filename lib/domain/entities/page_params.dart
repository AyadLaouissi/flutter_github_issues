import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class PageParams extends Equatable {
  final int page, take;
  final SortType sortType;
  final StateType stateType;

  PageParams({this.take = 20, this.page = 0, this.sortType, this.stateType = StateType.all});

  Map<String, dynamic> toJson() => {
        'per_page': this.take,
        'page': this.page,
        'sort': this.sortType != null ? describeEnum(this.sortType) : null,
        'state': this.stateType != null ? describeEnum(this.stateType) : null,
      };

  @override
  List<Object> get props => [
        this.page,
        this.take,
        this.sortType,
        this.stateType,
      ];
}

enum SortType { created, updated, comments }
enum StateType { open, closed, all }