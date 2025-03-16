import 'package:admin_quiz/core/constants/app_color.dart';
import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/utilities/app_styles.dart';
import 'package:flutter/material.dart';

class QuestionBox extends StatelessWidget {
  const QuestionBox({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    final double topPadding = getResponsiveSize(context, 12);
    final double boxHeight = getResponsiveSize(context, 45);
    final double borderRadius = getResponsiveSize(context, 8);
    final double leftPadding = getResponsiveSize(context, 5);
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Container(
        width: double.infinity,
        height: boxHeight,
        decoration: BoxDecoration(
          color: AppColor.kMidnightBlue,
          border: Border.all(color: AppColor.kGrayColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: leftPadding),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              text,
              style: AppStyles.mediumTextStyle16(context),
            ),
          ),
        ),
      ),
    );
  }
}
