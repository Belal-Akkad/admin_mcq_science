import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/features/exams/presentation/view/view_model/icon_button_model.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.iconButtonModel,
  });
  final IconButtonModel iconButtonModel;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: iconButtonModel.onPressed,
        borderRadius: BorderRadius.circular(50),
        splashFactory: InkRipple.splashFactory,
        radius: getResponsiveSize(context, 30),
        child: Icon(
          iconButtonModel.iconData,
          size: getResponsiveSize(context, 28),
          color: iconButtonModel.iconColor,
        ),
      ),
    );
  }
}
