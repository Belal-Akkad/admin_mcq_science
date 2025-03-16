import 'package:admin_quiz/core/constants/app_color.dart';
import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:flutter/material.dart';


class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double size = getResponsiveSize(context, 40);
    final double strokeWidth = getResponsiveSize(context, 4);
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        color: AppColor.kTurquoiseColor,
      ),
    );
  }
}
