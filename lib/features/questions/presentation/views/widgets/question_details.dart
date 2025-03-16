import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/features/questions/presentation/views/view_model/question_details_model.dart';
import 'package:admin_quiz/features/questions/presentation/views/widgets/question_actions.dart';
import 'package:admin_quiz/features/questions/presentation/views/widgets/question_header.dart';
import 'package:admin_quiz/features/questions/presentation/views/widgets/question_options.dart';
import 'package:admin_quiz/features/questions/presentation/views/widgets/question_text_card.dart';
import 'package:flutter/material.dart';


class QuestionDetails extends StatelessWidget {
  const QuestionDetails({
    super.key,
    required this.questionDetailsModel,
  });
  final QuestionDetailsModel questionDetailsModel;
  @override
  Widget build(BuildContext context) {
    final EdgeInsetsGeometry padding =
        EdgeInsets.all(getResponsiveSize(context, 22));

    return Padding(
      padding: padding,
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QuestionHeader(
                  questionModel: questionDetailsModel.questionModel,
                  questionsLength: questionDetailsModel.questionsLength,
                  questionNumber: questionDetailsModel.questionNumber,
                ),
                const Spacer(),
                QuestionTextCard(
                    questionText:
                        questionDetailsModel.questionModel.questionText),
                SizedBox(height: getResponsiveSize(context, 20)),
                QuestionOptions(
                  questionModel: questionDetailsModel.questionModel,
                ),
                const Spacer(),
                QuestionAction(
                  questionNumber: questionDetailsModel.questionNumber,
                  questionModel: questionDetailsModel.questionModel,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
