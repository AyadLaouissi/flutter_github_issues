import 'package:dartz/dartz.dart';
import 'package:flutter_media_markt/data/models/issues_model.dart';
import 'package:flutter_media_markt/domain/entities/app_error.dart';
import 'package:flutter_media_markt/domain/entities/page_params.dart';
import 'package:flutter_media_markt/domain/repositories/issues_repository.dart';
import 'package:flutter_media_markt/domain/usecases/usecase.dart';

class GetIssues extends UseCase<List<IssuesModel>, PageParams> {
  final IssuesRepository _issuesRepository;

  GetIssues(this._issuesRepository);

  @override
  Future<Either<AppError, List<IssuesModel>>> call(PageParams pageParams) async {
    return await this._issuesRepository.getIssues(pageParams);
  }
}