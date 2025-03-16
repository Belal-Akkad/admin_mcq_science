import 'package:admin_quiz/core/widgets/screen_background_image.dart';
import 'package:admin_quiz/features/splash/presentation/view/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(body: ScreenBackgroundImage(screen: SplashViewBody())),
    );
  }
}
