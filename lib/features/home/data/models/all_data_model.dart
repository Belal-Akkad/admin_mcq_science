
import 'package:admin_quiz/core/models/section_model.dart';

class AllDataModel {
  final Map<String, dynamic> questionsMap;
  final Map<String, dynamic> examMap;
  final List<SectionModel> sections;

  AllDataModel(
      {required this.questionsMap,
      required this.examMap,
      required this.sections});
}
