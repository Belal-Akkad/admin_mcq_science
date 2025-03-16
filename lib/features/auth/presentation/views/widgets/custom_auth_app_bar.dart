import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/utilities/app_styles.dart';
import 'package:flutter/material.dart';

class CustomAuthAppBar extends StatelessWidget {
  const CustomAuthAppBar({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry padding = EdgeInsets.only(
      bottom: getResponsiveSize(context, 20),
    );
    return Padding(
      padding: padding,
      child: Text(text, style: AppStyles.boldTextStayle30(context)),
    );
  }
}
