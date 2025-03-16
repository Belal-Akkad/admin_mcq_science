
import 'package:admin_quiz/core/models/exam_model.dart';

abstract class ExamState {}

class ExamInitialState extends ExamState {}

class ExamLoadingState extends ExamState {}

class ExamFailureState extends ExamState {
  final String errMessage;

  ExamFailureState({required this.errMessage});
}

class AddExamSuccessState extends ExamState {
  final ExamModel newExamModel;

  AddExamSuccessState({required this.newExamModel});
}

class DeleteExamSuccessState extends ExamState {
  final ExamModel deletedExamModel;

  DeleteExamSuccessState({required this.deletedExamModel});
}

class UpdateExamSuccessState extends ExamState {
  final ExamModel updatedExamModel;

  UpdateExamSuccessState({
    required this.updatedExamModel,
  });
}


