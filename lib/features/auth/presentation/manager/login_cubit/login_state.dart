abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailuerState extends LoginState {
  final String errMessage;

  LoginFailuerState({required this.errMessage});
}

class LoginLoadingState extends LoginState {}

class LoginAbsorptionStoppedState extends LoginState {}
