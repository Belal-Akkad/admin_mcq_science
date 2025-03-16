import 'package:admin_quiz/core/utilities/app_styles.dart';
import 'package:admin_quiz/features/home/presentation/views/widgets/custom_home_app_bar_action.dart';
import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'الصفحة الرئيسية',
          style: AppStyles.noramalTextStyle22(context),
        ),
        const CustomHomeAppBarAction(),
      ],
    );
  }
}
