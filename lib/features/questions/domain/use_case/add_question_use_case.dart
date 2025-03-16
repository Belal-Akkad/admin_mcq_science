import 'package:admin_quiz/core/errors/server_failures.dart';
import 'package:admin_quiz/core/functions/check_internet_connection.dart';
import 'package:admin_quiz/core/models/question_model.dart';
import 'package:admin_quiz/features/questions/domain/repo/question_repo.dart';
import 'package:dartz/dartz.dart';


class AddQuestionUseCase {
  AddQuestionUseCase({required this.questionRepo});

  final QuestionRepo questionRepo;
  Future<Either<ServerFailures, QuestionModel>> execute(
      {required QuestionModel questionModelToCreate}) async {
    if (await checkInternetConnection()) {
      return left(ServerFailures(errMessage: 'Check Your Internet'));
    } else {
      return await questionRepo.addQuestion(
          questionModelToCreate: questionModelToCreate);
    }
  }
}
