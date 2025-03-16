abstract class SignOutState {}

class SignOutInitialState extends SignOutState {}

class SignOutLoadingState extends SignOutState {}

class SignOutSuccessState extends SignOutState {}

class SignOutFailState extends SignOutState {
  final String errMessage;

  SignOutFailState({required this.errMessage});
}
