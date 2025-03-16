import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/models/exam_model.dart';
import 'package:admin_quiz/core/models/question_model.dart';
import 'package:admin_quiz/core/widgets/custom_card.dart';
import 'package:admin_quiz/features/exams/presentation/view/widgets/exam_actions.dart';
import 'package:admin_quiz/features/exams/presentation/view/widgets/exam_info_section.dart';
import 'package:admin_quiz/features/questions/presentation/views/questions_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ExamItem extends StatelessWidget {
  const ExamItem({
    super.key,
    required this.exam,
    required this.questions, 
  });

  final ExamModel exam;
  final List<QuestionModel> questions;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getResponsiveSize(context, 10)),
      child: GestureDetector(
        onTap: navigateToQuizView,
        child: CustomCard(
          child: Row(
            children: [
              ExamInfoSection(exam: exam),
              SizedBox(
                width: getResponsiveSize(context, 10),
              ),
               ExamActions(examModel: exam,),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToQuizView() {
   

  
    Get.to(
  () =>  QuestionsView(questions: questions, keyOfQuestions: exam.id),
      transition: Transition.fade,
    );
  }
}

