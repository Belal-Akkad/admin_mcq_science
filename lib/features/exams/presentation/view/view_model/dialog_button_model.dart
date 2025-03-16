import 'package:admin_quiz/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class DialogButtonModel {
  final String buttonText;
  final Color backgroundColor;
  final Color textColor;
  final void Function() onButtonPressed;
  DialogButtonModel({
    required this.onButtonPressed,
    required this.buttonText,
    this.backgroundColor = Colors.transparent,
    this.textColor = AppColor.kWhiteColor,
  });
}
