import 'package:admin_quiz/core/constants/app_color.dart';
import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/utilities/app_styles.dart';
import 'package:flutter/material.dart';

class PrimaryActionButton extends StatelessWidget {
  const PrimaryActionButton({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    final BorderRadiusGeometry borderRadius =
        BorderRadius.circular(getResponsiveSize(context, 12));
    final EdgeInsetsGeometry padding =
        EdgeInsets.all(getResponsiveSize(context, 10));
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: padding,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: AppColor.kPrimaryGradient,
          borderRadius: borderRadius,
        ),
        child: Text(
          text,
          style: AppStyles.boldTextStyle16(context).copyWith(
            color: AppColor.kBlackColor,
          ),
        ),
      ),
    );
  }
}
