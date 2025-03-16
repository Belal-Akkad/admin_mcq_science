import 'package:admin_quiz/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class IconButtonModel {
  final IconData iconData;
  final Color iconColor;
  final void Function() onPressed;
  IconButtonModel({
    required this.iconData,
    this.iconColor = AppColor.kWhiteColor,
    required this.onPressed,
  });
}
