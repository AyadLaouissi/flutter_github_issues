import 'package:dartz/dartz.dart';
import 'package:flutter_media_markt/data/data_sources/issues_data_source.dart';
import 'package:flutter_media_markt/data/models/issues_model.dart';
import 'package:flutter_media_markt/domain/entities/app_error.dart';
import 'package:flutter_media_markt/domain/entities/page_params.dart';
import 'package:flutter_media_markt/domain/repositories/issues_repository.dart';

class IssuesRepositoryImpl extends IssuesRepository {

  final IssuesDataSource _issuesDataSource;

  IssuesRepositoryImpl(this._issuesDataSource);

  @override
  Future<Either<AppError, List<IssuesModel>>> getIssues(PageParams pageParams) async {
    try {
      return Right(await this._issuesDataSource.getIssues(pageParams));
    } on AppError catch(error) {
      return Left(error);
    }
  }

}