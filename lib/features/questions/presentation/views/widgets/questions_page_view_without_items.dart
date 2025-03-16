import 'package:admin_quiz/core/constants/app_color.dart';
import 'package:admin_quiz/core/functions/custom_show_dialog.dart';
import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/widgets/custom_icon_button.dart';
import 'package:admin_quiz/core/widgets/custom_shimmer_text.dart';
import 'package:admin_quiz/features/exams/presentation/view/view_model/icon_button_model.dart';
import 'package:admin_quiz/features/questions/presentation/manager/question_cubit/question_cubit.dart';
import 'package:admin_quiz/features/questions/presentation/views/widgets/add_question_dialog_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionsPageViewWithoutItems extends StatelessWidget {
  const QuestionsPageViewWithoutItems({
    super.key,
    required this.categoryId,
  });

  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconButton(
            iconButtonModel: IconButtonModel(
              iconData: Icons.control_point,
        
              onPressed: () {
                customShowDialog(
                  cubit: context.read<QuestionCubit>(),
                  context: context,
                  content: AddQuestionDialogContent(
                    examId: categoryId,
                  ),
                );
              },
              iconColor: AppColor.kTurquoiseColor,
            ),
          ),
          SizedBox(
            height: getResponsiveSize(context, 20),
          ),
          const CustomShimmerText(
            text: 'أضف سؤالا جديدًا',
          )
        ],
      ),
    );
  }
}
