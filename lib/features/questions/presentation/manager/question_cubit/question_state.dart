
import 'package:admin_quiz/core/models/question_model.dart';

abstract class QuestionState {}

class QuestionInitialState extends QuestionState {}

class QuestionLoadingState extends QuestionState {}

class QuestionFailureState extends QuestionState {
  final String errMessage;

  QuestionFailureState({required this.errMessage});
}

class AddQuestionSuccessState extends QuestionState {
  final QuestionModel newQuestionModel;

  AddQuestionSuccessState({required this.newQuestionModel});
}

class DeleteQuestionSuccessState extends QuestionState {
  final QuestionModel deletedQuestionModel;

  DeleteQuestionSuccessState({required this.deletedQuestionModel});
}

class UpdateQuestionSuccessState extends QuestionState {
  final QuestionModel updatedQuestionModel;

  UpdateQuestionSuccessState({required this.updatedQuestionModel});
}

class QuestionAbsorptionStoppedState extends QuestionState {}
