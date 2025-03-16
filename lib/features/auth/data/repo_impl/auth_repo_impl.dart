import 'dart:io';
import 'package:admin_quiz/core/errors/server_failures.dart';
import 'package:admin_quiz/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:admin_quiz/features/auth/domain/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl extends AuthRepo {
  AuthRepoImpl({required this.authRemoteDataSource});
  final AuthRemoteDataSource authRemoteDataSource;

  @override
  Future<Either<ServerFailures, void>> loginInWithEmailAndPassword(
      {required String password, required String email}) async {
    try {
      await authRemoteDataSource.loginInWithEmailAndPassword(
          password: password, email: email);
      return right(null);
    } on AuthException catch (error) {
      return left(ServerAuthFailures.formAuthException(error));
    } on SocketException catch (error) {
      return left(ServerSocketFailures.fromSocketFailures(error));
    } catch (error) {
      return left(ServerFailures(errMessage: 'حدث خطأ، يرجى المحاولة لاحقًا'));
    }
  }

  @override
  Future<Either<ServerFailures, void>> signUpWithEmailAndPassword({
    required String password,
    required String email,
  }) async {
    try {
      await authRemoteDataSource.signUpWithEmailAndPassword(
        password: password,
        email: email,
      );

      return right(null);
    } on AuthException catch (error) {
      return left(ServerAuthFailures.formAuthException(error));
    } on SocketException catch (error) {
      return left(ServerSocketFailures.fromSocketFailures(error));
    } catch (error) {
      return left(ServerFailures(errMessage: 'حدث خطأ، يرجى المحاولة لاحقًا'));
    }
  }

  @override
  Future<Either<ServerFailures, void>> insertDataToUsersTable({
    required String password,
    required String email,
  }) async {
    try {
      await authRemoteDataSource.insertDataToUsersTable(
        password: password,
        email: email,
      );

      return right(null);
    } on PostgrestException catch (error) {
      return left(ServerPostgrestFailures.fromPostgrestException(error));
    } on SocketException catch (error) {
      return left(ServerSocketFailures.fromSocketFailures(error));
    } catch (error) {
      return left(ServerFailures(errMessage: 'حدث خطأ، يرجى المحاولة لاحقًا'));
    }
  }
}
