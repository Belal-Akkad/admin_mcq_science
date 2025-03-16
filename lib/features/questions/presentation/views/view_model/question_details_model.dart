
import 'package:admin_quiz/core/models/question_model.dart';

class QuestionDetailsModel {
  final int questionsLength;
  final QuestionModel questionModel;
  final int questionNumber;

  QuestionDetailsModel({
    required this.questionsLength,
    required this.questionModel,
    required this.questionNumber,
  });
}
