import 'package:admin_quiz/core/constants/app_color.dart';
import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/models/exam_model.dart';
import 'package:admin_quiz/core/utilities/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ExamInfoSection extends StatelessWidget {
  const ExamInfoSection({
    super.key,
    required this.exam,
  });

  final ExamModel exam;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            exam.examName,
            style: AppStyles.semiBoldTextStyle16(context),
          ),
          SizedBox(
            height: getResponsiveSize(context, 10),
          ),
          Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: AppColor.kTurquoiseColor,
            child: Divider(
              thickness: getResponsiveSize(context, 1),
            ),
          )
        ],
      ),
    );
  }
}
