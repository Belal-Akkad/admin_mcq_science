import 'package:admin_quiz/core/constants/app_color.dart';
import 'package:admin_quiz/core/functions/setup_server_locator.dart';
import 'package:admin_quiz/features/home/domain/use_case/fetch_exams_use_case.dart';
import 'package:admin_quiz/features/home/domain/use_case/fetch_questions_use_case.dart';
import 'package:admin_quiz/features/home/domain/use_case/fetch_sections_use_case.dart';
import 'package:admin_quiz/features/home/domain/use_case/sign_out_use_case.dart';
import 'package:admin_quiz/features/home/presentation/manager/fetch_all_data_cubit/fetch_all_data_cubit.dart';
import 'package:admin_quiz/features/home/presentation/manager/sign_out_cubit/sign_out_cubit.dart';
import 'package:admin_quiz/features/splash/presentation/view/spalsh_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ztoyctcguloevycguxvm.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp0b3ljdGNndWxvZXZ5Y2d1eHZtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMzMDQ1MDAsImV4cCI6MjA0ODg4MDUwMH0.VE0U08-_p3ERsgxv0dD-_IqvKAdQDIb1MH4oN7dbcDM',
  );
  setupServerLocator();

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const QuizApp(),
    ),
  );
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchAllDataCubit(
            fetchSectionsUseCase: getIt.get<FetchSectionsUseCase>(),
            fetchQuestionsUseCase: getIt.get<FetchQuestionsUseCase>(),
            fetchExamsUseCase: getIt.get<FetchExamsUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) => SignOutCubit(
            signOutUseCase: getIt.get<SignOutUseCase>(),
          ),
        )
      ],
      child: GetMaterialApp(
        locale: const Locale('ar', 'AE'),
        theme: ThemeData(scaffoldBackgroundColor: AppColor.kMidnightBlue),
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        builder: DevicePreview.appBuilder,
        home: const SplashView(),
      ),
    );
  }
}
