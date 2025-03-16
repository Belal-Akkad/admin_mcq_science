import 'package:admin_quiz/core/models/question_model.dart';
import 'package:admin_quiz/features/questions/presentation/views/widgets/page_view_builder.dart';
import 'package:flutter/material.dart';


class QuestionsViewBody extends StatelessWidget {
  const QuestionsViewBody({
    super.key,
    required this.questions,
    required this.keyOfQuestions,
  });
  final List<QuestionModel> questions;
  final int keyOfQuestions;
  @override
  Widget build(BuildContext context) {
    return PageViewBuilder(
      categoryId: keyOfQuestions,
      questions: questions,
    );
  }
}
