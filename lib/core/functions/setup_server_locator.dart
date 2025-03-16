import 'package:admin_quiz/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:admin_quiz/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:admin_quiz/features/auth/domain/repo/auth_repo.dart';
import 'package:admin_quiz/features/auth/domain/use_case/login_use_case.dart';
import 'package:admin_quiz/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:admin_quiz/features/home/data/data_source/home_remote_data_source.dart';
import 'package:admin_quiz/features/home/data/repo_impl/home_repo_impl.dart';
import 'package:admin_quiz/features/home/domain/repo/home_repo.dart';
import 'package:admin_quiz/features/home/domain/use_case/fetch_exams_use_case.dart';
import 'package:admin_quiz/features/home/domain/use_case/fetch_questions_use_case.dart';
import 'package:admin_quiz/features/home/domain/use_case/fetch_sections_use_case.dart';
import 'package:admin_quiz/features/home/domain/use_case/sign_out_use_case.dart';
import 'package:admin_quiz/features/exams/data/data_source/exam_remote_data_source.dart';
import 'package:admin_quiz/features/exams/data/repo_impl/exam_repo_impl.dart';
import 'package:admin_quiz/features/exams/domain/repo/exam_repo.dart';
import 'package:admin_quiz/features/exams/domain/use_case/add_exam_use_cae.dart';
import 'package:admin_quiz/features/exams/domain/use_case/delete_exam_use_case.dart';
import 'package:admin_quiz/features/exams/domain/use_case/update_exam_use_case.dart';
import 'package:admin_quiz/features/questions/data/data_source/question_remote_data_source.dart';
import 'package:admin_quiz/features/questions/data/repo_impl/question_repo_impl.dart';
import 'package:admin_quiz/features/questions/domain/repo/question_repo.dart';
import 'package:admin_quiz/features/questions/domain/use_case/add_question_use_case.dart';
import 'package:admin_quiz/features/questions/domain/use_case/delete_question_use_case.dart';
import 'package:admin_quiz/features/questions/domain/use_case/update_question_use_case.dart';
import 'package:get_it/get_it.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

void setupServerLocator() {
  getIt.registerSingleton<SupabaseClient>(Supabase.instance.client);

//home singlton

  getIt.registerSingleton<HomeRemoteDataSource>(
      HomeRemoteDataSource(supabaseClient: getIt.get<SupabaseClient>()));

  getIt.registerSingleton<HomeRepo>(
      HomeRepoImpl(remoteDataSource: getIt.get<HomeRemoteDataSource>()));

  getIt.registerSingleton<FetchSectionsUseCase>(
      FetchSectionsUseCase(homeRepo: getIt.get<HomeRepo>()));

  getIt.registerSingleton<FetchExamsUseCase>(
      FetchExamsUseCase(homeRepo: getIt.get<HomeRepo>()));

  getIt.registerSingleton<FetchQuestionsUseCase>(
      FetchQuestionsUseCase(homeRepo: getIt.get<HomeRepo>()));

// exam singlton

  getIt.registerSingleton<ExamRemotDataSource>(
      ExamRemotDataSource(supabaseClient: getIt.get<SupabaseClient>()));

  getIt.registerSingleton<ExamRepo>(
      ExamRepoImpl(examRemotDataSource: getIt.get<ExamRemotDataSource>()));

  getIt.registerSingleton<AddExamUseCase>(
      AddExamUseCase(examRepo: getIt.get<ExamRepo>()));

  getIt.registerSingleton<DeleteExamUseCase>(
      DeleteExamUseCase(examRepo: getIt.get<ExamRepo>()));

  getIt.registerSingleton<UpdateExamUseCase>(
      UpdateExamUseCase(examRepo: getIt.get<ExamRepo>()));

//question singleton

  getIt.registerSingleton<QuestionRemoteDataSource>(
      QuestionRemoteDataSource(supabaseClient: getIt.get<SupabaseClient>()));

  getIt.registerSingleton<QuestionRepo>(QuestionRepoImpl(
      questionRemoteDataSource: getIt.get<QuestionRemoteDataSource>()));

  getIt.registerSingleton<AddQuestionUseCase>(
      AddQuestionUseCase(questionRepo: getIt.get<QuestionRepo>()));

  getIt.registerSingleton<DeleteQuestionUseCase>(
      DeleteQuestionUseCase(questionRepo: getIt.get<QuestionRepo>()));

  getIt.registerSingleton<UpdateQuestionUseCase>(
      UpdateQuestionUseCase(questionRepo: getIt.get<QuestionRepo>()));

  // auth singlton

  getIt.registerSingleton<AuthRemoteDataSource>(
      AuthRemoteDataSource(supabaseClient: getIt.get<SupabaseClient>()));

  getIt.registerSingleton<AuthRepo>(
      AuthRepoImpl(authRemoteDataSource: getIt.get<AuthRemoteDataSource>()));

  getIt.registerSingleton<SignUpUseCase>(
      SignUpUseCase(authRepo: getIt.get<AuthRepo>()));

  getIt.registerSingleton<LoginUseCase>(
      LoginUseCase(authRepo: getIt.get<AuthRepo>()));

  getIt.registerSingleton<SignOutUseCase>(
      SignOutUseCase(homeRepo: getIt.get<HomeRepo>()));
}
