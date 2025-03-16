import 'package:admin_quiz/core/constants/app_color.dart';
import 'package:admin_quiz/core/utilities/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class CustomShimmerText extends StatelessWidget {
  const CustomShimmerText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Shimmer.fromColors(
        baseColor: AppColor.kWhiteColor,
        highlightColor: AppColor.kBlueGrayColor,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppStyles.noramalTextStyle18(
            context,
          ),
        ),
      ),
    );
  }
}
