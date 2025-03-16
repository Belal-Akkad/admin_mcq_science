import 'package:admin_quiz/core/widgets/screen_background_image.dart';
import 'package:admin_quiz/features/home/presentation/views/widgets/home_view_body_builder.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: ScreenBackgroundImage(
            screen: HomeViewBodyBuilder(),
          ),
        ),
      ),
    );
  }
}
