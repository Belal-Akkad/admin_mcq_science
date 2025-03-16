import 'package:admin_quiz/core/errors/server_failures.dart';
import 'package:admin_quiz/core/models/section_model.dart';
import 'package:admin_quiz/features/home/data/models/all_data_model.dart';
import 'package:admin_quiz/features/home/domain/use_case/fetch_exams_use_case.dart';
import 'package:admin_quiz/features/home/domain/use_case/fetch_questions_use_case.dart';
import 'package:admin_quiz/features/home/domain/use_case/fetch_sections_use_case.dart';
import 'package:admin_quiz/features/home/presentation/manager/fetch_all_data_cubit/fetch_all_data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FetchAllDataCubit extends Cubit<FetchAllDataState> {
  FetchAllDataCubit({
    required this.fetchSectionsUseCase,
    required this.fetchExamsUseCase,
    required this.fetchQuestionsUseCase,
  }) : super(FetchAllDataInitialState());

  final FetchSectionsUseCase fetchSectionsUseCase;
  final FetchExamsUseCase fetchExamsUseCase;
  final FetchQuestionsUseCase fetchQuestionsUseCase;
  Map<String, dynamic> questionsMap = {};
  Future<void> fetchAllData() async {
    emit(FetchAllDataLoadingState());
    fetchSectionData();
  }

  Future<void> fetchSectionData() async {
    var sections = await fetchSectionsUseCase.execute();
    sections.fold(
      (faile) {
        handlFaileState(faile);
      },
      (sections) async {
        fetchExamsData(sections);
      },
    );
  }

  Future<void> fetchExamsData(List<SectionModel> sections) async {
    var lessions = await fetchExamsUseCase.execute(sections: sections);
    lessions.fold(
      (faile) {
        handlFaileState(faile);
      },
      (exams) async {
        fetchQuestionsData(exams, sections);
      },
    );
  }

  Future<void> fetchQuestionsData(
      Map<String, dynamic> exams, List<SectionModel> sections) async {
    var questions = await fetchQuestionsUseCase.execute(examsMap: exams);
    questions.fold(
      (faile) {
        handlFaileState(faile);
      },
      (questions) {
        questionsMap = questions;
        emit(
          FetchAllDataSuccessState(
            allDataModel: AllDataModel(
              questionsMap: questionsMap,
              examMap: exams,
              sections: sections,
            ),
          ),
        );
      },
    );
  }

  void handlFaileState(ServerFailures faile) {
    emit(FetchAllDataFailureState(errMessage: faile.errMessage));
  }
}
