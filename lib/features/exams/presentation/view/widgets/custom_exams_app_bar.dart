import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/widgets/custom_icon_button.dart';
import 'package:admin_quiz/features/exams/presentation/view/view_model/icon_button_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CustomExamsAppBar extends StatelessWidget {
  const CustomExamsAppBar({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          iconButtonModel: IconButtonModel(iconData: Icons.arrow_back, onPressed:  () => Get.back(),),
     
        ),
        SvgPicture.asset(
          image,
          width: getResponsiveSize(context, 40),
          height: getResponsiveSize(context, 40),
        )
      ],
    );
  }
}
