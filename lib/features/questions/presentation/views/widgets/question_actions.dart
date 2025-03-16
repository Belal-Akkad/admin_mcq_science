import 'package:admin_quiz/core/functions/custom_show_dialog.dart';
import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/models/question_model.dart';
import 'package:admin_quiz/core/widgets/primary_action_button.dart';
import 'package:admin_quiz/features/questions/presentation/manager/question_cubit/question_cubit.dart';
import 'package:admin_quiz/features/questions/presentation/views/widgets/delete_question_dialog_content.dart';
import 'package:admin_quiz/features/questions/presentation/views/widgets/update_question_dialog_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionAction extends StatelessWidget {
  const QuestionAction(
      {super.key, required this.questionModel, required this.questionNumber});
  final QuestionModel questionModel;
  final int questionNumber;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: PrimaryActionButton(
            text: 'حذف',
            onTap: () {
              customShowDialog(
                context: context,
                content: DeleteQuestionDialogContent(
                  questionNumber: questionNumber,
                  questionModel: questionModel,
                ),
                cubit: BlocProvider.of<QuestionCubit>(context),
              );
            },
          ),
        ),
        SizedBox(
          width: getResponsiveSize(context, 10),
        ),
        Expanded(
          child: PrimaryActionButton(
            text: 'تحديث',
            onTap: () {
              customShowDialog(
                context: context,
                content:
                    UpdateQuestionDialogContente(questionModel: questionModel),
                cubit: BlocProvider.of<QuestionCubit>(context),
              );
            },
          ),
        ),
      ],
    );
  }
}
