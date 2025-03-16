import 'package:admin_quiz/core/functions/setup_server_locator.dart';
import 'package:admin_quiz/core/models/question_model.dart';
import 'package:admin_quiz/core/widgets/screen_background_image.dart';
import 'package:admin_quiz/features/questions/domain/use_case/add_question_use_case.dart';
import 'package:admin_quiz/features/questions/domain/use_case/delete_question_use_case.dart';
import 'package:admin_quiz/features/questions/domain/use_case/update_question_use_case.dart';
import 'package:admin_quiz/features/questions/presentation/manager/question_cubit/question_cubit.dart';
import 'package:admin_quiz/features/questions/presentation/views/widgets/question_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionsView extends StatelessWidget {
  const QuestionsView(
      {super.key, required this.questions, required this.keyOfQuestions});
  final List<QuestionModel> questions;
  final int keyOfQuestions;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionCubit(
        updateQuestionUseCase: getIt.get<UpdateQuestionUseCase>(),
        deleteQuestionUseCase: getIt.get<DeleteQuestionUseCase>(),
        addQuestionUseCase: getIt.get<AddQuestionUseCase>(),
      ),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: ScreenBackgroundImage(
            screen: QuestionsViewBody(
              keyOfQuestions: keyOfQuestions,
              questions: questions,
            ),
          ),
        ),
      ),
    );
  }
}
