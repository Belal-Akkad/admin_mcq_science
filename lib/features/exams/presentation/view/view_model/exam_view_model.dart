import 'package:admin_quiz/core/models/exam_model.dart';

class ExamViewModel {
  final List<ExamModel> exams;
  final String image;
  final int sectionId;
  final Map<String, dynamic> questionsMap;

  ExamViewModel(
      {required this.exams,
      required this.image,
      required this.sectionId,
      required this.questionsMap});
}
