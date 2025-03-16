import 'package:admin_quiz/core/functions/setup_server_locator.dart';
import 'package:admin_quiz/core/widgets/screen_background_image.dart';
import 'package:admin_quiz/features/auth/domain/use_case/login_use_case.dart';
import 'package:admin_quiz/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:admin_quiz/features/auth/presentation/views/widgets/login_view_body_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(signInUseCase: getIt.get<LoginUseCase>()),
      child: const SafeArea(
        child: Scaffold(
          body: ScreenBackgroundImage(screen: LoginViewBodyBuilder()),
        ),
      ),
    );
  }
}
