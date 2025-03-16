import 'package:admin_quiz/core/widgets/screen_background_image.dart';
import 'package:admin_quiz/features/home/presentation/views/widgets/error_view_body.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    required this.errMessage,
  });
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScreenBackgroundImage(
          screen: ErrorViewBody(errMessage: errMessage),
        ),
      ),
    );
  }
}
