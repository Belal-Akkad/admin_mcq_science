import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/models/section_model.dart';
import 'package:admin_quiz/core/widgets/custom_modal_progress_hug.dart';
import 'package:admin_quiz/features/home/presentation/manager/sign_out_cubit/sign_out_cubit.dart';
import 'package:admin_quiz/features/home/presentation/manager/sign_out_cubit/sign_out_state.dart';
import 'package:admin_quiz/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:admin_quiz/features/home/presentation/views/widgets/sections_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required this.sections,
    required this.examsMap, required this.questionsMap,
  });
  final List<SectionModel> sections;
  final Map<String, dynamic> examsMap;
  final Map<String,dynamic> questionsMap;

  @override
  Widget build(BuildContext context) {
    final EdgeInsetsGeometry padding = EdgeInsets.all(
      getResponsiveSize(context, 12),
    );
    return BlocBuilder<SignOutCubit, SignOutState>(
      builder: (context, state) {
        return CustomModalProgressHUD(
          inAsyncCall: state is SignOutLoadingState,
          child: Padding(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHomeAppBar(),
                SizedBox(height: getResponsiveSize(context, 20)),
                Expanded(
                  child: SectionsListView(
                    questionsMap: questionsMap,
                    sections: sections,
                    examsMap: examsMap,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
