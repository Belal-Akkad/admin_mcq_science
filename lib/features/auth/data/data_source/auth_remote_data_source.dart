import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSource({required this.supabaseClient});
  final String adminsTable = 'admins';
  Future<void> loginInWithEmailAndPassword(
      {required String password, required String email}) async {
    await supabaseClient.auth.signInWithPassword(
      password: password,
      email: email,
    );
  }

  Future<void> signUpWithEmailAndPassword({
    required String password,
    required String email,
  }) async {
    await supabaseClient.auth.signUp(
      password: password,
      email: email,
    );
  }

  Future<void> insertDataToUsersTable({
    required String email,
    required String password,
  }) async {
    await supabaseClient.from(adminsTable).insert(
      {
        'email': email,
        'password': password,
      },
    );
  }
}
