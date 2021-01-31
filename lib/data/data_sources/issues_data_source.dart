import 'package:flutter_media_markt/data/core/api_client.dart';
import 'package:flutter_media_markt/data/models/issues_model.dart';
import 'package:flutter_media_markt/domain/entities/page_params.dart';

abstract class IssuesDataSource {
  Future<List<IssuesModel>> getIssues(PageParams pageParams);
}

class IssuesDataSourceImpl extends IssuesDataSource {
  final ApiClient _apiClient;

  IssuesDataSourceImpl(this._apiClient);

  @override
  Future<List<IssuesModel>> getIssues(PageParams pageParams) async {
    return (await this._apiClient.get(
              'repos/flutter/flutter/issues',
              queryParameters: pageParams.toJson(),
            ) as List)
        .map((e) => IssuesModel.fromJson(e))
        .toList();
  }
}
