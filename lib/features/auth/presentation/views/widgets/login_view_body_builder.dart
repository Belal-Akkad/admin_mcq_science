import 'package:admin_quiz/core/functions/show_snack_bar.dart';
import 'package:admin_quiz/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:admin_quiz/features/auth/presentation/manager/login_cubit/login_state.dart';
import 'package:admin_quiz/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBodyBuilder extends StatefulWidget {
  const LoginViewBodyBuilder({
    super.key,
  });

  @override
  State<LoginViewBodyBuilder> createState() => _LoginViewBodyBuilderState();
}

class _LoginViewBodyBuilderState extends State<LoginViewBodyBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailuerState) {
          showSnackBar(context,
              titleText: 'فشلت العملية ', messageText: state.errMessage);
        }
      },
      builder: (context, state) {
        return LoginViewBody(
          isAbsorbing: state is LoginFailuerState,
          inAsyncCall: state is LoginLoadingState,
        );
      },
    );
  }
}
