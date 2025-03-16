import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/widgets/custom_shimmer_text.dart';
import 'package:admin_quiz/features/exams/presentation/view/widgets/custom_exams_app_bar.dart';
import 'package:flutter/material.dart';

class EmptyExamsViewBody extends StatelessWidget {
  const EmptyExamsViewBody({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getResponsiveSize(context, 12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomExamsAppBar(image: image),
          const Spacer(),
          const Center(
            child: CustomShimmerText(text: 'لم تتم إضافة أي اختبار بعد'),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
