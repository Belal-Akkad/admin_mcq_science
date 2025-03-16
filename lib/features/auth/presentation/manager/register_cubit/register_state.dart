abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterFailuerState extends RegisterState {
  final String errMessage;

  RegisterFailuerState({required this.errMessage});
}

class RegisterAbsorptionStoppedState extends RegisterState {}
