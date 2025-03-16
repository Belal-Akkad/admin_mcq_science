import 'package:admin_quiz/core/constants/app_color.dart';
import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/utilities/app_styles.dart';
import 'package:admin_quiz/features/exams/presentation/view/view_model/dialog_button_model.dart';
import 'package:flutter/material.dart';


class DialogButton extends StatelessWidget {
  const DialogButton({
    super.key,
    required this.dialogButtonModel,
  });
  final DialogButtonModel dialogButtonModel;
  @override
  Widget build(BuildContext context) {

    final double width = getResponsiveSize(context, 2);
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: dialogButtonModel.backgroundColor,
    
        shape: StadiumBorder(
          side: BorderSide(
            width: width,
            color: AppColor.kGrayColor,
          ),
        ),
      ),
      onPressed: dialogButtonModel.onButtonPressed,
      child: Text(
        dialogButtonModel.buttonText,
        style: AppStyles.mediumTextStyle16(context)
            .copyWith(color: dialogButtonModel.textColor),
      ),
    );
  }
}
