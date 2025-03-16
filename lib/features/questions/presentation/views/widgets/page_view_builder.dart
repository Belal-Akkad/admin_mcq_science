import 'package:admin_quiz/core/functions/handle_success_state.dart';
import 'package:admin_quiz/core/functions/show_state_message.dart';
import 'package:admin_quiz/core/models/question_model.dart';
import 'package:admin_quiz/features/questions/presentation/manager/question_cubit/question_cubit.dart';
import 'package:admin_quiz/features/questions/presentation/manager/question_cubit/question_state.dart';
import 'package:admin_quiz/features/questions/presentation/views/widgets/questions_page_view_with_items.dart';
import 'package:admin_quiz/features/questions/presentation/views/widgets/questions_page_view_without_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PageViewBuilder extends StatefulWidget {
  const PageViewBuilder({
    super.key,
    required this.questions,
    required this.categoryId,
  });
  final List<QuestionModel> questions;
  final int categoryId;
  @override
  State<PageViewBuilder> createState() => _PageViewBuilderState();
}

class _PageViewBuilderState extends State<PageViewBuilder> {
  late List<QuestionModel> questions;
  late int categoryId;
  @override
  initState() {
    questions = widget.questions;
    categoryId = widget.categoryId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionCubit, QuestionState>(
      listener: (context, state) {
        if (state is AddQuestionSuccessState) {
          questions.add(state.newQuestionModel);
          handleSuccessState('تمت الإضافة بنجاح', context);
        } else if (state is DeleteQuestionSuccessState) {
          questions.removeWhere(
              (question) => (question.id == state.deletedQuestionModel.id));
          handleSuccessState('تم الحذف بنجاح', context);
        } else if (state is UpdateQuestionSuccessState) {
          questions[questions.indexWhere(
                  (question) => question.id == state.updatedQuestionModel.id)] =
              state.updatedQuestionModel;
          handleSuccessState('تم التحديث بنجاح', context);
        } else if (state is QuestionFailureState) {
          showStateMessage('فشل', state.errMessage, context);
        } else if (state is QuestionLoadingState) {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      },
      builder: (context, state) {
        if (questions.isEmpty) {
          return QuestionsPageViewWithoutItems(categoryId: categoryId);
        } else {
          return QuestionsPageViewWithItems(
            questions: questions,
       
          );
        }
      },
    );
  }
}
