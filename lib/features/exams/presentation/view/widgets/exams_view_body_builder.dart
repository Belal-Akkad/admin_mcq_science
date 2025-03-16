import 'package:admin_quiz/core/functions/handle_success_state.dart';
import 'package:admin_quiz/core/functions/show_state_message.dart';
import 'package:admin_quiz/core/models/exam_model.dart';
import 'package:admin_quiz/core/models/question_model.dart';
import 'package:admin_quiz/features/exams/presentation/view/manager/exam_cubit/exam_cubit.dart';
import 'package:admin_quiz/features/exams/presentation/view/manager/exam_cubit/exam_state.dart';
import 'package:admin_quiz/features/exams/presentation/view/widgets/exmas_view_body_swithcer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamsViewBodyBuilder extends StatefulWidget {
  const ExamsViewBodyBuilder(
      {super.key,
      required this.exams,
      required this.image,
      required this.questionsMap});
  final List<ExamModel> exams;
  final Map<String, dynamic> questionsMap;
  final String image;
  @override
  State<ExamsViewBodyBuilder> createState() => _ExamsViewBodyBuilderState();
}

class _ExamsViewBodyBuilderState extends State<ExamsViewBodyBuilder> {
  late List<ExamModel> exams;
  late Map<String, dynamic> questionsMap;
  late String image;
  @override
  void initState() {
    exams = widget.exams;
    image = widget.image;
    questionsMap = widget.questionsMap;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExamCubit, ExamState>(
      listener: (context, state) {
        if (state is AddExamSuccessState) {
          List<QuestionModel> newQuestions = [];
          exams.add(state.newExamModel);
          questionsMap.addAll({state.newExamModel.id.toString(): newQuestions});
          handleSuccessState('تمت إضافة الاختبار', context);
        } else if (state is UpdateExamSuccessState) {
          exams[exams
                  .indexWhere((exam) => exam.id == state.updatedExamModel.id)] =
              state.updatedExamModel;
          handleSuccessState('تم تحديث الاسم', context);
        } else if (state is DeleteExamSuccessState) {
          questionsMap.remove(state.deletedExamModel.id.toString());
          exams.remove(state.deletedExamModel);
          handleSuccessState('تم حذف الاختبار', context);
        } else if (state is ExamFailureState) {
          showStateMessage('فشل', state.errMessage, context);
        } else if (state is ExamLoadingState) {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      },
      builder: (context, state) {
        return ExamsViewBodySwitcher(exams: exams, image: image);
      },
    );
  }
}
