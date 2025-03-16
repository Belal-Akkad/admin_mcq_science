import 'package:admin_quiz/core/enum/admin_field_type.dart';
import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/models/question_model.dart';
import 'package:admin_quiz/core/utilities/app_styles.dart';
import 'package:admin_quiz/features/exams/presentation/view/view_model/admin_text_field_model.dart';
import 'package:admin_quiz/core/widgets/admin_text_form_field.dart';
import 'package:admin_quiz/core/widgets/build_dialog_actions.dart';
import 'package:admin_quiz/features/questions/presentation/manager/question_cubit/question_cubit.dart';
import 'package:admin_quiz/features/questions/presentation/manager/question_cubit/question_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class UpdateQuestionDialogContente extends StatefulWidget {
  const UpdateQuestionDialogContente({super.key, required this.questionModel});
  final QuestionModel questionModel;
  @override
  State<UpdateQuestionDialogContente> createState() =>
      _UpdateQuestionDialogContenteState();
}

class _UpdateQuestionDialogContenteState
    extends State<UpdateQuestionDialogContente> {
  String? choice1, choice2, choice3, choice4, questionText;
  int? correctAnswer;
  late List<AdminTextFieldModel> _field;
  final GlobalKey<FormState> _updateQuestionFormKey = GlobalKey();

  @override
  void initState() {
    _field = [
      AdminTextFieldModel(
        adminFieldType: AdminFieldType.updateQuestionText,
        labelText: 'نص السؤال',
        oldText: widget.questionModel.questionText,
        onSaved: (value) {
          questionText = value;
        },
      ),
      AdminTextFieldModel(
        adminFieldType: AdminFieldType.updateQuestionChoice,
        labelText: 'الاختيار 1',
        oldText: widget.questionModel.choices[0],
        onSaved: (value) {
          choice1 = value;
        },
      ),
      AdminTextFieldModel(
        adminFieldType: AdminFieldType.updateQuestionChoice,
        labelText: 'الاختيار 2',
        oldText: widget.questionModel.choices[1],
        onSaved: (value) {
          choice2 = value;
        },
      ),
      AdminTextFieldModel(
        adminFieldType: AdminFieldType.updateQuestionChoice,
        labelText: 'الاختيار 3',
        oldText: widget.questionModel.choices[2],
        onSaved: (value) {
          choice3 = value;
        },
      ),
      AdminTextFieldModel(
        adminFieldType: AdminFieldType.updateQuestionChoice,
        labelText: 'الاختيار 4',
        oldText: widget.questionModel.choices[3],
        onSaved: (value) {
          choice4 = value;
        },
      ),
      AdminTextFieldModel(
        adminFieldType: AdminFieldType.updateQuestionCorrectAnswer,
        labelText: 'الإجابة الصحيحة',
        oldText: widget.questionModel.correctAnswer.toString(),
        onSaved: (value) {
          correctAnswer = toInt(value);
        },
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionCubit, QuestionState>(
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Padding(
            padding: EdgeInsets.all(getResponsiveSize(context, 12)),
            child: Form(
              key: _updateQuestionFormKey,
              child: Column(
                children: [
                  Text('تحديث السؤال',
                      style: AppStyles.mediumTextStyle18(context)),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: getResponsiveSize(context, 5),
                          ),
                          child: AdminTextFormField(model: _field[index]),
                        );
                      },
                    ),
                  ),
                  BuildDialogActions(
                    isLoading: (state is QuestionLoadingState),
                    onButtonPressed: _updateQuestion,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _updateQuestion() {
    _updateQuestionFormKey.currentState?.save();

    if ([questionText, choice1, choice2, choice3, choice4]
            .every((element) => element == '') &&
        correctAnswer == null) {
      Get.back();
      return;
    } else if (questionText == widget.questionModel.questionText &&
        choice1 == widget.questionModel.choices[0] &&
        choice2 == widget.questionModel.choices[1] &&
        choice3 == widget.questionModel.choices[2] &&
        choice4 == widget.questionModel.choices[3] &&
        correctAnswer == widget.questionModel.correctAnswer) {
      Get.back();
      return;
    } else {
      questionText =
          questionText != '' ? questionText : widget.questionModel.questionText;
      choice1 = choice1 != '' ? choice1 : widget.questionModel.choices[0];
      choice2 = choice2 != '' ? choice2 : widget.questionModel.choices[1];
      choice3 = choice3 != '' ? choice3 : widget.questionModel.choices[2];
      choice4 = choice4 != '' ? choice4 : widget.questionModel.choices[3];
      correctAnswer = correctAnswer ?? widget.questionModel.correctAnswer;
    }
    if (_updateQuestionFormKey.currentState!.validate()) {
      context.read<QuestionCubit>().updateQuestion(
            questionModelToUpdate: QuestionModel(
              id: widget.questionModel.id,
              questionText: questionText!,
              choices: [choice1!, choice2!, choice3!, choice4!],
              correctAnswer: correctAnswer!,
              examId: widget.questionModel.examId,
            ),
          );
    }
  }
}
