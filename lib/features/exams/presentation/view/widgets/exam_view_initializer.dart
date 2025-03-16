import 'package:admin_quiz/core/functions/setup_server_locator.dart';

import 'package:admin_quiz/features/exams/domain/use_case/add_exam_use_cae.dart';
import 'package:admin_quiz/features/exams/domain/use_case/delete_exam_use_case.dart';
import 'package:admin_quiz/features/exams/domain/use_case/update_exam_use_case.dart';
import 'package:admin_quiz/features/exams/presentation/view/exams_view.dart';
import 'package:admin_quiz/features/exams/presentation/view/manager/exam_cubit/exam_cubit.dart';
import 'package:admin_quiz/features/exams/presentation/view/view_model/exam_view_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamViewInitializer extends StatelessWidget {
  const ExamViewInitializer(
      {super.key, required this.examViewModel});
 
 final ExamViewModel examViewModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExamCubit(
        addExamUseCase: getIt.get<AddExamUseCase>(),
        updateExamUseCase: getIt.get<UpdateExamUseCase>(),
        deleteExamUseCase: getIt.get<DeleteExamUseCase>(),
      ),
      child:ExamsView(examViewModel: examViewModel,) 
    );
  }
}
