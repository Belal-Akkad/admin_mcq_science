import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/utilities/app_styles.dart';
import 'package:admin_quiz/core/widgets/custom_card.dart';
import 'package:flutter/material.dart';


class QuestionTextCard extends StatelessWidget {
  const QuestionTextCard({
    super.key,
    required this.questionText,
  });
  final String questionText;
  @override
  Widget build(BuildContext context) {
    final EdgeInsetsGeometry padding =
        EdgeInsets.symmetric(vertical: getResponsiveSize(context, 20));
    return CustomCard(
      child: Padding(
        padding: padding,
        child: Text(
          questionText,
          style: AppStyles.mediumTextStyle16(context),
        ),
      ),
    );
  }
}
