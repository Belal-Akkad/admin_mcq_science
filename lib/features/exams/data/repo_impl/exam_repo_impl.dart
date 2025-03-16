import 'package:admin_quiz/core/errors/server_failures.dart';
import 'package:admin_quiz/core/models/exam_model.dart';
import 'package:admin_quiz/features/exams/data/data_source/exam_remote_data_source.dart';
import 'package:admin_quiz/features/exams/domain/repo/exam_repo.dart';
import 'package:dartz/dartz.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class ExamRepoImpl extends ExamRepo {
  ExamRepoImpl({required this.examRemotDataSource});
  final ExamRemotDataSource examRemotDataSource;

  @override
  Future<Either<ServerFailures, ExamModel>> addExam(
      {required ExamModel examModelToCreate}) async {
    try {
      ExamModel createdExamModel = await examRemotDataSource
          .exam(examModelToCreate: examModelToCreate);
      return right(createdExamModel);
    } on PostgrestException catch (error) {
      return left(ServerPostgrestFailures.fromPostgrestException(error));
    } catch (error) {
      return left(
          ServerFailures(errMessage: 'حدث خطأ، يرجى المحاولة لاحقا'));
    }
  }



  @override
  Future<Either<ServerFailures, ExamModel>> deleteExam(
      {required ExamModel examModelToDelete}) async {
    try {
      await examRemotDataSource.deleteExam(
          examModelToDelete: examModelToDelete);
      return right(examModelToDelete);
    } on PostgrestException catch (error) {
      return left(ServerPostgrestFailures.fromPostgrestException(error));
    } catch (error) {
      return left(
          ServerFailures(errMessage: 'حدث خطأ، يرجى المحاولة لاحقا'));
    }
  }



  @override
  Future<Either<ServerFailures, ExamModel>> updateExam({
    required ExamModel examModelToUpdate,
  }) async {
    try {
      await examRemotDataSource.updateExam(
        examModelToUpdate: examModelToUpdate,
      );
      return right(examModelToUpdate);
    } on PostgrestException catch (error) {
      return left(ServerPostgrestFailures.fromPostgrestException(error));
    } catch (error) {
      return left(
          ServerFailures(errMessage: 'حدث خطأ، يرجى المحاولة لاحقا'));
    }
  }


}
