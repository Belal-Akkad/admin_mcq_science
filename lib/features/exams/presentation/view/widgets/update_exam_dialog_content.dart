import 'package:admin_quiz/core/enum/admin_field_type.dart';
import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/models/exam_model.dart';
import 'package:admin_quiz/core/utilities/app_styles.dart';
import 'package:admin_quiz/features/exams/presentation/view/manager/exam_cubit/exam_cubit.dart';
import 'package:admin_quiz/features/exams/presentation/view/manager/exam_cubit/exam_state.dart';
import 'package:admin_quiz/features/exams/presentation/view/view_model/admin_text_field_model.dart';
import 'package:admin_quiz/core/widgets/admin_text_form_field.dart';
import 'package:admin_quiz/core/widgets/build_dialog_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';


class UpdateExamDialogContent extends StatefulWidget {
  const UpdateExamDialogContent({
    super.key,
    required this.examModel,
  });
  final ExamModel examModel;
  @override
  State<UpdateExamDialogContent> createState() =>
      _UpdateExamDialogContentState();
}

class _UpdateExamDialogContentState
    extends State<UpdateExamDialogContent> {
  String? _updatedExamName;

  final GlobalKey<FormState> _updateExamFormKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamCubit, ExamState>(
      builder: (context, state) {
        return Form(
          key: _updateExamFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('تحديث اسم الاختبار',
                  style: AppStyles.mediumTextStyle18(context)),
              SizedBox(
                height: getResponsiveSize(context, 10),
              ),
              AdminTextFormField(
                model: AdminTextFieldModel(
                  adminFieldType: AdminFieldType.updateExam,
                  oldText: widget.examModel.examName,
                  labelText: 'الاسم',
                  onSaved: (value) {
                    _updatedExamName = value;
                  },
                ),
              ),
              SizedBox(
                height: getResponsiveSize(context, 10),
              ),
              BuildDialogActions(
                isLoading: (state is ExamLoadingState),
                onButtonPressed: _updateExam,
              )
            ],
          ),
        );
      },
    );
  }

  void _updateExam() {
    _updateExamFormKey.currentState!.save();
    if (_updatedExamName == ''||_updatedExamName==widget.examModel.examName) {
      Get.back();
    } else {
      context.read<ExamCubit>().updateExam(
            examModelToUpdate: ExamModel(
              id: widget.examModel.id,
              examName: _updatedExamName!, sectionId: widget.examModel.sectionId,
            ),
          );
    }
  }
}
