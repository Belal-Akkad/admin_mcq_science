import 'package:admin_quiz/core/errors/server_failures.dart';
import 'package:admin_quiz/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';


class FetchQuestionsUseCase {
  FetchQuestionsUseCase({required this.homeRepo});
  final HomeRepo homeRepo;

  Future<Either<ServerFailures, Map<String, dynamic>>> execute(
      {required Map<String, dynamic> examsMap}) async {
    return await homeRepo.fetchQuestions(examsMap: examsMap);
  }
}
