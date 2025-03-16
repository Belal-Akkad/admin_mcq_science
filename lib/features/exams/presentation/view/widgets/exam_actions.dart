import 'package:admin_quiz/core/functions/custom_show_dialog.dart';
import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/models/exam_model.dart';
import 'package:admin_quiz/core/widgets/custom_icon_button.dart';
import 'package:admin_quiz/features/exams/presentation/view/manager/exam_cubit/exam_cubit.dart';
import 'package:admin_quiz/features/exams/presentation/view/view_model/icon_button_model.dart';
import 'package:admin_quiz/features/exams/presentation/view/widgets/delete_exam_dialog_content.dart';
import 'package:admin_quiz/features/exams/presentation/view/widgets/update_exam_dialog_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamActions extends StatelessWidget {
  const ExamActions({
    super.key, required this.examModel,
  });

final ExamModel examModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomIconButton(
          iconButtonModel: IconButtonModel(
            iconData: Icons.delete,
            onPressed: () {
              customShowDialog(
                context: context,
                content:
                    DeleteExamDialogContent(examModel: examModel),
                cubit: BlocProvider.of<ExamCubit>(context),
              );
            },
          ),
  
        ),
        SizedBox(
          width: getResponsiveSize(context, 16),
        ),
        CustomIconButton(
        iconButtonModel: IconButtonModel(
            iconData: Icons.edit,
            onPressed: () {
              customShowDialog(
                context: context,
                content:
                    UpdateExamDialogContent(examModel: examModel),
                cubit: BlocProvider.of<ExamCubit>(context),
              );
            },
          ),
        ),
      ],
    );
  }
}