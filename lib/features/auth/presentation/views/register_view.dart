import 'package:admin_quiz/core/functions/setup_server_locator.dart';
import 'package:admin_quiz/core/widgets/screen_background_image.dart';
import 'package:admin_quiz/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:admin_quiz/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:admin_quiz/features/auth/presentation/views/widgets/register_view_body_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RegisterCubit(signUpUseCase: getIt.get<SignUpUseCase>()),
      child: const SafeArea(
        child: Scaffold(
          body: ScreenBackgroundImage(screen: RegisterViewBodyBuilder()),
        ),
      ),
    );
  }
}
