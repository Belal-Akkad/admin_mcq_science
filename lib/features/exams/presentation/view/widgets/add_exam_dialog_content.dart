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


class AddExamDialogContent extends StatefulWidget {
  const AddExamDialogContent({super.key, required this.sectionId});

final int sectionId;
  @override
  State<AddExamDialogContent> createState() =>
      _AddExamDialogContentState();
}

class _AddExamDialogContentState extends State<AddExamDialogContent> {
  String? _examName;
  final GlobalKey<FormState> _addExamFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamCubit, ExamState>(
      builder: (context, state) {
        return Form(
          key: _addExamFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('أضف اختبارًا جديدًا',
                  style: AppStyles.mediumTextStyle18(context)),
              SizedBox(
                height: getResponsiveSize(context, 10),
              ),
              AdminTextFormField(
                model: AdminTextFieldModel(
                  adminFieldType: AdminFieldType.addExam,
                  oldText: '',
                  labelText: 'اسم الاختبار',
                  onSaved: (value) {
                    _examName = value;
                  },
                ),
              ),
              SizedBox(
                height: getResponsiveSize(context, 10),
              ),
              BuildDialogActions(
                isLoading: state is ExamLoadingState,
                onButtonPressed: _addExam,
              )
            ],
          ),
        );
      },
    );
  }

  void _addExam() {
    if (_addExamFormKey.currentState!.validate()) {
      _addExamFormKey.currentState!.save();
      context.read<ExamCubit>().addExam(
            examModelToCreate: ExamModel(
              id: 0,

              examName: _examName!, sectionId: widget.sectionId,
            ),
          );
    }
  }
}
