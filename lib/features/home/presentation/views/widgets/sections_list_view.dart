import 'package:admin_quiz/core/constants/app_asset.dart';
import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/functions/get_screen_width.dart';
import 'package:admin_quiz/core/models/section_model.dart';
import 'package:admin_quiz/features/exams/presentation/view/view_model/exam_view_model.dart';
import 'package:admin_quiz/features/home/presentation/views/view_model/section_item_model.dart';
import 'package:admin_quiz/features/home/presentation/views/widgets/section_item.dart';
import 'package:admin_quiz/features/exams/presentation/view/widgets/exam_view_initializer.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SectionsListView extends StatelessWidget {
  const SectionsListView(
      {super.key,
      required this.sections,
      required this.examsMap,
      required this.questionsMap});
  final List<SectionModel> sections;
  final Map<String, dynamic> examsMap;
  final Map<String, dynamic> questionsMap;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: getCrossAxisCount(context),
        crossAxisSpacing: getResponsiveSize(context, 30),
        mainAxisSpacing: getResponsiveSize(context, 30),
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            navigateToExamsView(index);
          },
          child: SectionItem(
            sectionItemModel: SectionItemModel(
              text: sections[index].sectionName,
              image: AppAsset.kSectionsImages[index],
            ),
          ),
        );
      },
      itemCount: sections.length,
    );
  }

  void navigateToExamsView(int index) {
    Get.to(
      () => ExamViewInitializer(
        examViewModel: ExamViewModel(
          questionsMap: questionsMap,
          sectionId: sections[index].id,
          image: AppAsset.kSectionsImages[index],
          exams: examsMap[sections[index].id.toString()],
        ),
      ),
      transition: Transition.fade,
    );
  }

  int getCrossAxisCount(BuildContext context) {
    double width = getScreenWidth(context);
    if (width >= 800) {
      return 3;
    } else {
      return 2;
    }
  }
}
