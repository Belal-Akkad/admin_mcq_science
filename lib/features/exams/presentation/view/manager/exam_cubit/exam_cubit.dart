import 'package:admin_quiz/core/models/exam_model.dart';
import 'package:admin_quiz/features/exams/domain/use_case/add_exam_use_cae.dart';
import 'package:admin_quiz/features/exams/domain/use_case/delete_exam_use_case.dart';
import 'package:admin_quiz/features/exams/domain/use_case/update_exam_use_case.dart';
import 'package:admin_quiz/features/exams/presentation/view/manager/exam_cubit/exam_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ExamCubit extends Cubit<ExamState> {
  ExamCubit(
      {required this.addExamUseCase,
      required this.deleteExamUseCase,
      required this.updateExamUseCase})
      : super(ExamInitialState());


  final AddExamUseCase addExamUseCase;
  final DeleteExamUseCase deleteExamUseCase;
  final UpdateExamUseCase updateExamUseCase;
 
  Future<void> addExam(
      {required ExamModel examModelToCreate}) async {
    emit(ExamLoadingState());
    var result = await addExamUseCase.execute(
        examModelToCreate: examModelToCreate);
    result.fold(
      (faile) {
        emit(ExamFailureState(errMessage: faile.errMessage));
      },
      (newExamModel) {
        emit(AddExamSuccessState(newExamModel: newExamModel));
      },
    );
  }

  Future<void> deleteExam(
      {required ExamModel examModelToDelete}) async {
    emit(ExamLoadingState());
    var result = await deleteExamUseCase.execute(
        examModeltoDelete: examModelToDelete);
    result.fold(
      (faile) {
        faile.errMessage;
        emit(ExamFailureState(errMessage: faile.errMessage));

      },
      (deletedExamModel) {
        emit(DeleteExamSuccessState(
            deletedExamModel: deletedExamModel));
      },
    );
  }

  Future<void> updateExam({
    required ExamModel examModelToUpdate,
  }) async {
    emit(ExamLoadingState());
    var result = await updateExamUseCase.execute(
      examModelToUpdate: examModelToUpdate,
    );
    result.fold(
      (faile) {
        faile.errMessage;
        emit(ExamFailureState(errMessage: faile.errMessage));
  
      },
      (updatedExamModel) {
        emit(
          UpdateExamSuccessState(
            updatedExamModel: updatedExamModel,
          ),
        );
      },
    );
  }
}
