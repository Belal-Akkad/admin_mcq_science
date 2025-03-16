import 'package:admin_quiz/core/models/question_model.dart';
import 'package:admin_quiz/features/questions/presentation/views/widgets/question_box.dart';
import 'package:flutter/material.dart';


class QuestionOptions extends StatelessWidget {
  const QuestionOptions({super.key, required this.questionModel});
  final QuestionModel questionModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionBox(text: '1 : ${questionModel.choices[0]}'),
        QuestionBox(text: '2 : ${questionModel.choices[1]}'),
        QuestionBox(text: '3 : ${questionModel.choices[2]}'),
        QuestionBox(text: '4 : ${questionModel.choices[3]}'),
        QuestionBox(text: 'الإجابة الصحيحة : ${questionModel.correctAnswer}'),
      ],
    );
  }
}
