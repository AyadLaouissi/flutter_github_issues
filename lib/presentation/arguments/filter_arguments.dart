import 'package:flutter/foundation.dart';
import 'package:flutter_media_markt/domain/entities/page_params.dart';

class FilterArguments {

  final SortType sortType;
  final StateType stateType;

  const FilterArguments({@required this.sortType, @required this.stateType});
}