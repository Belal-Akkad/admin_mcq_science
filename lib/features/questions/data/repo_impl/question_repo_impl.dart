import 'package:admin_quiz/core/errors/server_failures.dart';
import 'package:admin_quiz/core/models/question_model.dart';
import 'package:admin_quiz/features/questions/data/data_source/question_remote_data_source.dart';
import 'package:admin_quiz/features/questions/domain/repo/question_repo.dart';
import 'package:dartz/dartz.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class QuestionRepoImpl extends QuestionRepo {
  QuestionRepoImpl({required this.questionRemoteDataSource});
  final QuestionRemoteDataSource questionRemoteDataSource;


  @override
  Future<Either<ServerFailures, QuestionModel>> addQuestion(
      {required QuestionModel questionModelToCreate}) async {
    try {
      QuestionModel createdQuestionModel = await questionRemoteDataSource
          .addQuestion(questionModelToCreate: questionModelToCreate);
      return right(createdQuestionModel);
    } on PostgrestException catch (error) {
      return left(ServerPostgrestFailures.fromPostgrestException(error));
    } catch (error) {
      return left(
          ServerFailures(errMessage: 'حدث خطأ، يرجى المحاولة لاحقا'));
    }
  }


  @override
  Future<Either<ServerFailures, QuestionModel>> deleteQuestion(
      {required QuestionModel questionModelToDelete}) async {
    try {
      await questionRemoteDataSource.deleteQuestion(
          questionModelToDelete: questionModelToDelete);
      return right(questionModelToDelete);
    } on PostgrestException catch (error) {
      return left(ServerPostgrestFailures.fromPostgrestException(error));
    } catch (error) {
      return left(
          ServerFailures(errMessage: 'حدث خطأ، يرجى المحاولة لاحقا'));
    }
  }



  @override
  Future<Either<ServerFailures, QuestionModel>> updateQuestion(
      {required QuestionModel questionModelToUpdate}) async {
    try {
      await questionRemoteDataSource.updateQuestion(
          editedQuestionModel: questionModelToUpdate);
      return right(questionModelToUpdate);
    } on PostgrestException catch (error) {
      return left(ServerPostgrestFailures.fromPostgrestException(error));
    } catch (error) {
      return left(
          ServerFailures(errMessage:'حدث خطأ، يرجى المحاولة لاحقا'));
    }
  }
}
