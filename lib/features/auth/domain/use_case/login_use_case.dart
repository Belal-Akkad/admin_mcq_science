import 'package:admin_quiz/core/errors/server_failures.dart';
import 'package:admin_quiz/features/auth/domain/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  LoginUseCase({required this.authRepo});
  final AuthRepo authRepo;
  Future<Either<ServerFailures, void>> execute(
      {required String password, required String email}) async {
    return await authRepo.loginInWithEmailAndPassword(
        email: email, password: password);
  }
}
