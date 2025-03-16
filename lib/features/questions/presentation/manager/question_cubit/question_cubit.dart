import 'package:admin_quiz/core/models/question_model.dart';
import 'package:admin_quiz/features/questions/domain/use_case/add_question_use_case.dart';
import 'package:admin_quiz/features/questions/domain/use_case/delete_question_use_case.dart';
import 'package:admin_quiz/features/questions/domain/use_case/update_question_use_case.dart';
import 'package:admin_quiz/features/questions/presentation/manager/question_cubit/question_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit({
    required this.addQuestionUseCase,
    required this.updateQuestionUseCase,
    required this.deleteQuestionUseCase,
  }) : super(QuestionInitialState());
  final AddQuestionUseCase addQuestionUseCase;
  final DeleteQuestionUseCase deleteQuestionUseCase;
  final UpdateQuestionUseCase updateQuestionUseCase;


  Future<void> addQuestion(
      {required QuestionModel questionModelToCreate}) async {
    emit(QuestionLoadingState());
    var resulte = await addQuestionUseCase.execute(
        questionModelToCreate: questionModelToCreate);
    resulte.fold(
      (faile) {
        emit(QuestionFailureState(errMessage: faile.errMessage));
      },
      (newQuestion) {
        emit(
          AddQuestionSuccessState(newQuestionModel: newQuestion),
        );
      },
    );
  }

  Future<void> deleteQuestion(
      {required QuestionModel questionModelToDelete}) async {
    emit(QuestionLoadingState());
    var resulte = await deleteQuestionUseCase.execute(
        questionModelToDelete: questionModelToDelete);
    resulte.fold(
      (faile) {
        emit(QuestionFailureState(errMessage: faile.errMessage));
      },
      (deletedQuestionModel) {
        emit(
          DeleteQuestionSuccessState(
              deletedQuestionModel: deletedQuestionModel),
        );
      },
    );
  }

  Future<void> updateQuestion(
      {required QuestionModel questionModelToUpdate}) async {
    emit(QuestionLoadingState());
    var resulte = await updateQuestionUseCase.execute(
        questionModelToUpdate: questionModelToUpdate);
    resulte.fold(
      (faile) {
        emit(QuestionFailureState(errMessage: faile.errMessage));
      },
      (updatedQuestionModel) {
        emit(
          UpdateQuestionSuccessState(
              updatedQuestionModel: updatedQuestionModel),
        );
      },
    );
  }
}
