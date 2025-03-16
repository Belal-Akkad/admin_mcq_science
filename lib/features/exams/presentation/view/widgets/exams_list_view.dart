import 'package:admin_quiz/core/models/exam_model.dart';
import 'package:admin_quiz/features/home/presentation/manager/fetch_all_data_cubit/fetch_all_data_cubit.dart';
import 'package:admin_quiz/features/exams/presentation/view/widgets/exam_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamsListView extends StatelessWidget {
  const ExamsListView({
    super.key,
    required this.exams,
  });

  final List<ExamModel> exams;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: exams.length,
      itemBuilder: (context, index) {
        return ExamItem(
          exam: exams[index],
          questions: BlocProvider.of<FetchAllDataCubit>(context)
              .questionsMap[exams[index].id.toString()],
        );
      },
    );
  }
}
