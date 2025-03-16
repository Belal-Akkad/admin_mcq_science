import 'package:admin_quiz/core/enum/admin_field_type.dart';
import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/functions/get_screen_height.dart';
import 'package:admin_quiz/core/models/question_model.dart';
import 'package:admin_quiz/core/utilities/app_styles.dart';
import 'package:admin_quiz/features/exams/presentation/view/view_model/admin_text_field_model.dart';
import 'package:admin_quiz/core/widgets/admin_text_form_field.dart';
import 'package:admin_quiz/core/widgets/build_dialog_actions.dart';
import 'package:admin_quiz/features/questions/presentation/manager/question_cubit/question_cubit.dart';
import 'package:admin_quiz/features/questions/presentation/manager/question_cubit/question_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddQuestionDialogContent extends StatefulWidget {
  const AddQuestionDialogContent({super.key, required this.examId});
  final int examId;
  @override
  State<AddQuestionDialogContent> createState() =>
      _AddQuestionDialogContentState();
}

class _AddQuestionDialogContentState extends State<AddQuestionDialogContent> {
  String? choice1, choice2, choice3, choice4, questionText;
  int? correctAnswer;
  final GlobalKey<FormState> _addQuestionFormKey = GlobalKey();
  late List<AdminTextFieldModel> _field;

  @override
  void initState() {
    _field = [
      AdminTextFieldModel(
        adminFieldType: AdminFieldType.addQuestionText,
        labelText: 'نص السؤال',
       
        onSaved: (value) {
          questionText = value;
        },
      ),
      AdminTextFieldModel(
        adminFieldType: AdminFieldType.addQuestionChoice,
        labelText: 'الاختيار 1',
        onSaved: (value) {
          choice1 = value;
        },
      ),
      AdminTextFieldModel(
        adminFieldType: AdminFieldType.addQuestionChoice,
        labelText: 'الاختيار 2',
        onSaved: (value) {
          choice2 = value;
        },
      ),
      AdminTextFieldModel(
        adminFieldType: AdminFieldType.addQuestionChoice,
        labelText: 'الاختيار 3',
        onSaved: (value) {
          choice3 = value;
        },
      ),
      AdminTextFieldModel(
        adminFieldType: AdminFieldType.addQuestionChoice,
        labelText: 'الاختيار 4',
        onSaved: (value) {
          choice4 = value;
        },
      ),
      AdminTextFieldModel(
        adminFieldType: AdminFieldType.addQuestionCorrectAnswer,
        labelText: 'الأجابة الصحيحة',
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
        return AbsorbPointer(
          absorbing:
              (state is QuestionLoadingState || state is QuestionFailureState),
          child: SizedBox(
            height: getScreenHeight(context) * 0.4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _addQuestionFormKey,
                child: Column(
                  children: [
                    Text('أضف سؤالا جديداً',
                        style: AppStyles.mediumTextStyle18(context)),
                    SizedBox(
                      height: getResponsiveSize(context, 10),
                    ),
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
                      onButtonPressed: _addQuestion,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _addQuestion() {
    if (_addQuestionFormKey.currentState!.validate()) {
      _addQuestionFormKey.currentState!.save();
      context.read<QuestionCubit>().addQuestion(
            questionModelToCreate: QuestionModel(
              id: 0,
              questionText: questionText!,
              choices: [
                choice1!,
                choice2!,
                choice3!,
                choice4!,
              ],
              correctAnswer: correctAnswer!,
              examId: widget.examId,
            ),
          );
    }
  }
}
