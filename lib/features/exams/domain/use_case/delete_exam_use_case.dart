import 'package:admin_quiz/core/errors/server_failures.dart';
import 'package:admin_quiz/core/functions/check_internet_connection.dart';
import 'package:admin_quiz/core/models/exam_model.dart';
import 'package:admin_quiz/features/exams/domain/repo/exam_repo.dart';
import 'package:dartz/dartz.dart';

class DeleteExamUseCase {


  DeleteExamUseCase({required this.examRepo});
    final ExamRepo examRepo;
  Future<Either<ServerFailures, ExamModel>> execute(
      {required ExamModel examModeltoDelete}) async {
    if (await checkInternetConnection()) {
      return left(ServerFailures(errMessage: 'Check Your Internet'));
    } else {
      return await examRepo.deleteExam(
        examModelToDelete: examModeltoDelete,
      );
    }
  }
}
