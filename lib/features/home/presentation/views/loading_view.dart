import 'package:admin_quiz/core/widgets/screen_background_image.dart';
import 'package:admin_quiz/features/home/presentation/views/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';


class LoadingView extends StatelessWidget {
  const LoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ScreenBackgroundImage(
          screen: Center(
            child: CustomLoadingIndicator(),
          ),
        ),
      ),
    );
  }
}
