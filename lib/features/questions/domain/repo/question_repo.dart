import 'package:admin_quiz/core/errors/server_failures.dart';
import 'package:admin_quiz/core/models/question_model.dart';
import 'package:dartz/dartz.dart';


abstract class QuestionRepo {


  Future<Either<ServerFailures, QuestionModel>> addQuestion(
      {required QuestionModel questionModelToCreate});


  Future<Either<ServerFailures, QuestionModel>> deleteQuestion(
      {required QuestionModel questionModelToDelete});



  Future<Either<ServerFailures, QuestionModel>> updateQuestion(
      {required QuestionModel questionModelToUpdate});
}
