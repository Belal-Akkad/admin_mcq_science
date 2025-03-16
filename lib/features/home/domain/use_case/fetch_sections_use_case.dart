import 'package:admin_quiz/core/errors/server_failures.dart';
import 'package:admin_quiz/core/models/section_model.dart';
import 'package:admin_quiz/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';


class FetchSectionsUseCase {
  FetchSectionsUseCase({required this.homeRepo});
  final HomeRepo homeRepo;

  Future<Either<ServerFailures, List<SectionModel>>> execute() async {
    return await homeRepo.fetchSections();
  }
}
