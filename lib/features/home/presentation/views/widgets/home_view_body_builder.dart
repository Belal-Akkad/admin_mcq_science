import 'package:admin_quiz/features/home/presentation/manager/fetch_all_data_cubit/fetch_all_data_cubit.dart';
import 'package:admin_quiz/features/home/presentation/manager/fetch_all_data_cubit/fetch_all_data_state.dart';
import 'package:admin_quiz/features/home/presentation/views/error_view.dart';
import 'package:admin_quiz/features/home/presentation/views/loading_view.dart';
import 'package:admin_quiz/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBodyBuilder extends StatefulWidget {
  const HomeViewBodyBuilder({
    super.key,
  });

  @override
  State<HomeViewBodyBuilder> createState() => _HomeViewBodyBuilderState();
}

class _HomeViewBodyBuilderState extends State<HomeViewBodyBuilder> {
  @override
  void initState() {
    BlocProvider.of<FetchAllDataCubit>(context).fetchAllData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return BlocBuilder<FetchAllDataCubit, FetchAllDataState>(
          builder: (context, state) {
            if (state is FetchAllDataSuccessState) {
              return HomeViewBody(
                questionsMap: state.allDataModel.questionsMap,
                sections: state.allDataModel.sections,
                examsMap: state.allDataModel.examMap,
              );
            } else if (state is FetchAllDataFailureState) {
              return ErrorView(errMessage: state.errMessage);
            } else {
              return const LoadingView();
            }
          },
        );
      },
    );
  }
}
