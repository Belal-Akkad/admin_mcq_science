import 'package:admin_quiz/core/errors/server_failures.dart';
import 'package:admin_quiz/core/models/exam_model.dart';
import 'package:dartz/dartz.dart';


abstract class ExamRepo {
  Future<Either<ServerFailures, ExamModel>> addExam(
      {required ExamModel examModelToCreate});


  Future<Either<ServerFailures, ExamModel>> deleteExam(
      {required ExamModel examModelToDelete});


  Future<Either<ServerFailures, ExamModel>> updateExam({
    required ExamModel examModelToUpdate,
  });

  
}
