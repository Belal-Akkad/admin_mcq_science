import 'package:admin_quiz/core/constants/app_duration.dart';
import 'package:admin_quiz/features/auth/domain/use_case/login_use_case.dart';
import 'package:admin_quiz/features/auth/presentation/manager/login_cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.signInUseCase}) : super(LoginInitialState());

  final LoginUseCase signInUseCase;
  Future<void> _resetAbsorptionEffect() async {
    await Future.delayed(AppDuration.authAbsorptionPointerDuration);
    emit(LoginAbsorptionStoppedState());
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());
    var resulte = await signInUseCase.execute(password: password, email: email);

    resulte.fold(
      (fail) async {
        emit(LoginFailuerState(errMessage: fail.errMessage));
        await _resetAbsorptionEffect();
      },
      (sucess) {
        emit(LoginSuccessState());
      },
    );
  }
}
