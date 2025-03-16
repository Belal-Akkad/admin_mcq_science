import 'package:admin_quiz/core/constants/app_color.dart';
import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:flutter/material.dart';


class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final EdgeInsetsGeometry padding = EdgeInsets.symmetric(
      horizontal: getResponsiveSize(context, 10),
      vertical: getResponsiveSize(context, 20),
    );
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(getResponsiveSize(context, 12)),
        ),
        color: AppColor.kMidnightBlue,
        elevation: 5,
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
