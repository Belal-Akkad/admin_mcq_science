import 'package:admin_quiz/core/models/exam_model.dart';
import 'package:admin_quiz/features/exams/presentation/view/widgets/empty_exams_view_body.dart';
import 'package:admin_quiz/features/exams/presentation/view/widgets/exams_view_body.dart';
import 'package:flutter/material.dart';


class ExamsViewBodySwitcher extends StatelessWidget {
  const ExamsViewBodySwitcher(
      {super.key, required this.exams, required this.image});
  final List<ExamModel> exams;
  final String image;
  @override
  Widget build(BuildContext context) {
    return exams.isEmpty
        ? EmptyExamsViewBody(image: image)
        : ExamsViewBody(lessions: exams, image: image);
  }
}
