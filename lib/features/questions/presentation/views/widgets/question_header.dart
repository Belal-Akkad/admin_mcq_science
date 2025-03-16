import 'package:admin_quiz/core/constants/app_color.dart';
import 'package:admin_quiz/core/functions/custom_show_dialog.dart';
import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/models/question_model.dart';
import 'package:admin_quiz/core/utilities/app_styles.dart';
import 'package:admin_quiz/core/widgets/custom_icon_button.dart';
import 'package:admin_quiz/features/exams/presentation/view/view_model/icon_button_model.dart';
import 'package:admin_quiz/features/questions/presentation/manager/question_cubit/question_cubit.dart';
import 'package:admin_quiz/features/questions/presentation/views/widgets/add_question_dialog_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class QuestionHeader extends StatelessWidget {
  const QuestionHeader({
    super.key,
    required this.questionNumber,
    required this.questionsLength,
    required this.questionModel,
  });
  final int questionNumber;
  final QuestionModel questionModel;
  final int questionsLength;
  @override
  Widget build(BuildContext context) {
    final double dividerThickness = getResponsiveSize(context, 2);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                text: 'السؤال  $questionNumber',
                style: AppStyles.mediumnTextStayle30(context),
                children: [
                  TextSpan(
                    text: ' / $questionsLength',
                    style: AppStyles.mediumnTextStayle20(context),
                  )
                ],
              ),
            ),
            CustomIconButton(
              iconButtonModel: IconButtonModel(
                iconData: Icons.control_point,
                onPressed: () {
                  customShowDialog(
                    cubit: context.read<QuestionCubit>(),
                    context: context,
                    content: AddQuestionDialogContent(
                      examId: questionModel.examId,
                    ),
                  );
                },
                iconColor: AppColor.kTurquoiseColor,
              ),
            )
          ],
        ),
        SizedBox(height: getResponsiveSize(context, 10)),
        Divider(color: AppColor.kGrayColor, thickness: dividerThickness),
      ],
    );
  }
}
