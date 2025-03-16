import 'package:admin_quiz/core/errors/server_failures.dart';
import 'package:admin_quiz/core/models/section_model.dart';
import 'package:admin_quiz/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';


class FetchExamsUseCase {
  FetchExamsUseCase({
    required this.homeRepo,
  });

  final HomeRepo homeRepo;

  Future<Either<ServerFailures, Map<String, dynamic>>> execute(
      {required List<SectionModel> sections}) async {
    return await homeRepo.fetchExams(sections: sections);
  }
}
