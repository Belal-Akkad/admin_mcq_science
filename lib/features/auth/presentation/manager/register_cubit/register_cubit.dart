import 'package:admin_quiz/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:admin_quiz/features/auth/presentation/manager/register_cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.signUpUseCase}) : super(RegisterInitialState());

  final SignUpUseCase signUpUseCase;

  Future<void> _resetAbsorptionEffect() async {
    await Future.delayed(const Duration(milliseconds: 2600));
    emit(RegisterAbsorptionStoppedState());
  }

  Future<void> register({
    required String password,
    required String email,
  }) async {
    emit(RegisterLoadingState());
    var result = await signUpUseCase.execute(
      password: password,
      email: email,
    );

    result.fold(
      (faile) async {
        emit(RegisterFailuerState(errMessage: faile.errMessage));
        await _resetAbsorptionEffect();
      },
      (success) {
        emit(RegisterSuccessState());
      },
    );
  }
}
