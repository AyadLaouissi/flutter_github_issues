import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PageParams extends Equatable {

  int page;
  final int take;

  PageParams({this.take = 20, this.page = 0});

  void incrementCounter() => this.page++;

  Map<String, dynamic> toJson() => {
    'per_page': this.take,
    'page': this.page,
  };

  @override
  List<Object> get props => [this.page, this.take];
}