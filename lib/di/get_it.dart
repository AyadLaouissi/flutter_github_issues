import 'package:dio/dio.dart';
import 'package:flutter_media_markt/data/core/api_client.dart';
import 'package:flutter_media_markt/data/data_sources/issues_data_source.dart';
import 'package:flutter_media_markt/data/repositories/issues_repository_impl.dart';
import 'package:flutter_media_markt/domain/repositories/issues_repository.dart';
import 'package:flutter_media_markt/domain/usecases/get_issues.dart';
import 'package:get_it/get_it.dart';

final getItInstance = GetIt.I;

Future init() async {

  getItInstance.registerLazySingleton<Dio>(() => Dio());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<IssuesDataSource>(
          () => IssuesDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<GetIssues>(
          () => GetIssues(getItInstance()));

  getItInstance.registerLazySingleton<IssuesRepository>(
          () => IssuesRepositoryImpl(getItInstance()));

}