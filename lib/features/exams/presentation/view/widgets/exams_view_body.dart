import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/models/exam_model.dart';
import 'package:admin_quiz/core/utilities/app_styles.dart';
import 'package:admin_quiz/features/exams/presentation/view/widgets/custom_exams_app_bar.dart';
import 'package:admin_quiz/features/exams/presentation/view/widgets/exams_list_view.dart';
import 'package:flutter/material.dart';

class ExamsViewBody extends StatelessWidget {
  const ExamsViewBody(
      {super.key, required this.lessions, required this.image});
  final List<ExamModel> lessions;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getResponsiveSize(context, 12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomExamsAppBar(image: image),
          SizedBox(
            height: getResponsiveSize(context, 20),
          ),
          Text(
         'البدء باختبار...',
            style: AppStyles.noramalTextStyle22(context),
          ),
          SizedBox(
            height: getResponsiveSize(context, 20),
          ),
          Expanded(
            child: ExamsListView(exams: lessions),
          ),
        ],
      ),
    );
  }
}
