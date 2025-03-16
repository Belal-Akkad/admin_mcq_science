import 'package:admin_quiz/features/home/domain/use_case/sign_out_use_case.dart';
import 'package:admin_quiz/features/home/presentation/manager/sign_out_cubit/sign_out_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit({required this.signOutUseCase}) : super(SignOutInitialState());
  final SignOutUseCase signOutUseCase;

  void signOut() async {
    emit(SignOutLoadingState());
    var response = await signOutUseCase.execute();
    response.fold(
      (fail) {
        emit(SignOutFailState(errMessage: fail.errMessage));
      },
      (sucess) {
        emit(SignOutSuccessState());
      },
    );
  }
}
