import 'package:admin_quiz/core/models/question_model.dart';
import 'package:admin_quiz/features/questions/presentation/views/view_model/question_details_model.dart';
import 'package:admin_quiz/features/questions/presentation/views/widgets/question_details.dart';
import 'package:flutter/material.dart';


class QuestionsPageViewWithItems extends StatelessWidget {
  const QuestionsPageViewWithItems(
      {super.key, required this.questions, });
  final List<QuestionModel> questions;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: questions.length,
      itemBuilder: (context, index) {
        return QuestionDetails(
          questionDetailsModel: QuestionDetailsModel(
      
            questionsLength: questions.length,
            questionModel: questions[index],
            questionNumber: index + 1,
          ),
        );
      },
    );
  }
}
