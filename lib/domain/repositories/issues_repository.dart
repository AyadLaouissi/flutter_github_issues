import 'package:dartz/dartz.dart';
import 'package:flutter_media_markt/data/models/issues_model.dart';
import 'package:flutter_media_markt/domain/entities/app_error.dart';
import 'package:flutter_media_markt/domain/entities/page_params.dart';

abstract class IssuesRepository {
  Future<Either<AppError, List<IssuesModel>>> getIssues(PageParams pageParams);
}