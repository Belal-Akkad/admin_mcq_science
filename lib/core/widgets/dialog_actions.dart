import 'package:admin_quiz/core/constants/app_color.dart';
import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/features/exams/presentation/view/view_model/dialog_button_model.dart';
import 'package:admin_quiz/core/widgets/dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DialogActions extends StatelessWidget {
  const DialogActions({
    super.key,
    required this.onButtonPressed,
  });
  final void Function() onButtonPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DialogButton(
          dialogButtonModel: DialogButtonModel(
            onButtonPressed: () {
              Get.back();
            },
            buttonText: 'لا',
            textColor: AppColor.kGrayColor,
          ),
        ),
        SizedBox(width: getResponsiveSize(context, 15)),
        DialogButton(
          dialogButtonModel: DialogButtonModel(
            onButtonPressed: onButtonPressed,
            buttonText: 'نعم',
            backgroundColor: AppColor.kGrayColor,
          ),
        ),
      ],
    );
  }
}
