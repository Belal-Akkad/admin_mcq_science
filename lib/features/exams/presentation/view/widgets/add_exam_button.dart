import 'package:admin_quiz/core/constants/app_color.dart';
import 'package:admin_quiz/core/functions/custom_show_dialog.dart';
import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/features/exams/presentation/view/manager/exam_cubit/exam_cubit.dart';
import 'package:admin_quiz/features/exams/presentation/view/widgets/add_exam_dialog_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AddExamButton extends StatelessWidget {
  const AddExamButton({super.key, required this.sectionId});
final int sectionId;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customShowDialog(
          content:  AddExamDialogContent(sectionId: sectionId,),
          context: context,
          cubit: BlocProvider.of<ExamCubit>(context),
        );
      },
      child: SizedBox(
        width: getResponsiveSize(context, 65),
        height: getResponsiveSize(context, 65),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppColor.kPrimaryGradient,
          ),
          child: Icon(
            Icons.add,
            size: getResponsiveSize(context, 30),
          ),
        ),
      ),
    );
  }
}
