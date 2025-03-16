import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/models/exam_model.dart';
import 'package:admin_quiz/core/utilities/app_styles.dart';
import 'package:admin_quiz/features/exams/presentation/view/manager/exam_cubit/exam_cubit.dart';
import 'package:admin_quiz/features/exams/presentation/view/manager/exam_cubit/exam_state.dart';
import 'package:admin_quiz/core/widgets/build_dialog_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DeleteExamDialogContent extends StatelessWidget {
  const DeleteExamDialogContent({
    super.key,
    required this.examModel,
  });

  final ExamModel examModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamCubit, ExamState>(
      builder: (context, state) {
        return Column(
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
              'هل أنت متأكد من حذف  "${examModel.examName}" ؟',
              style: AppStyles.mediumTextStyle16(context),
            ),
            SizedBox(
              height: getResponsiveSize(context, 15),
            ),
            BuildDialogActions(
              isLoading: (state is ExamLoadingState),
              onButtonPressed: () {
                deleteExam(context);
              },
            )
          ],
        );
      },
    );
  }

  void deleteExam(BuildContext context) {
    context
        .read<ExamCubit>()
        .deleteExam(examModelToDelete: examModel);
  }
}
