import 'package:admin_quiz/core/errors/server_failures.dart';
import 'package:admin_quiz/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';


class SignOutUseCase {
  final HomeRepo homeRepo;

  SignOutUseCase({required this.homeRepo});

  Future<Either<ServerFailures, void>> execute() async {
    return await homeRepo.signOut();
  }
}
