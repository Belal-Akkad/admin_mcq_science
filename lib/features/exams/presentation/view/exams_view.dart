import 'package:admin_quiz/core/widgets/screen_background_image.dart';
import 'package:admin_quiz/features/exams/presentation/view/view_model/exam_view_model.dart';
import 'package:admin_quiz/features/exams/presentation/view/widgets/add_exam_button.dart';
import 'package:admin_quiz/features/exams/presentation/view/widgets/exams_view_body_builder.dart';
import 'package:flutter/material.dart';

class ExamsView extends StatelessWidget {
  const ExamsView({super.key, required this.examViewModel});
  final ExamViewModel examViewModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: AddExamButton(sectionId: examViewModel.sectionId),
        resizeToAvoidBottomInset: false,
        body: ScreenBackgroundImage(
          screen: ExamsViewBodyBuilder(
            exams: examViewModel.exams,
            image: examViewModel.image,
            questionsMap: examViewModel.questionsMap,
          ),
        ),
      ),
    );
  }
}
