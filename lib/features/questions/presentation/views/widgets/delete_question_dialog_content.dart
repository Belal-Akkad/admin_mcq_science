import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/models/question_model.dart';
import 'package:admin_quiz/core/utilities/app_styles.dart';
import 'package:admin_quiz/core/widgets/build_dialog_actions.dart';
import 'package:admin_quiz/features/questions/presentation/manager/question_cubit/question_cubit.dart';
import 'package:admin_quiz/features/questions/presentation/manager/question_cubit/question_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DeleteQuestionDialogContent extends StatelessWidget {
  const DeleteQuestionDialogContent(
      {super.key, required this.questionModel, required this.questionNumber});
  final QuestionModel questionModel;
  final int questionNumber;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionCubit, QuestionState>(
      builder: (context, state) {
        return AbsorbPointer(
          absorbing:
              (state is QuestionLoadingState || state is QuestionFailureState),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
            'تأكيد الحذف',
                style: AppStyles.mediumnTextStayle20(context),
              ),
              SizedBox(
                height: getResponsiveSize(context, 10),
              ),
              Text(
               'هل أنت متأكد من حذف السؤال  "${questionModel.questionText}" ؟',
                style: AppStyles.mediumTextStyle16(context),
              ),
              SizedBox(
                height: getResponsiveSize(context, 15),
              ),
              BuildDialogActions(
                isLoading: (state is QuestionLoadingState),
                onButtonPressed: () {
                  _deleteQuestion(context);
                },
              )
            ],
          ),
        );
      },
    );
  }

  void _deleteQuestion(BuildContext context) {
    context
        .read<QuestionCubit>()
        .deleteQuestion(questionModelToDelete: questionModel);
  }
}
