import 'package:admin_quiz/core/constants/app_color.dart';
import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/functions/get_screen_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


Future<dynamic> customShowDialog<cubitType extends Cubit>({
  required BuildContext context,
  required Widget content,
  required cubitType cubit,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      final BorderRadiusGeometry borderRadius = BorderRadius.circular(
        getResponsiveSize(context, 22),
      );
      final double width = getScreenWidth(context) * 0.6;
      final EdgeInsetsGeometry padding =
          EdgeInsets.all(getResponsiveSize(context, 20));
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        backgroundColor: AppColor.kMidnightBlue,
        child: Container(
          width: width,
          padding: padding,
          child: BlocProvider.value(
            value: cubit,
            child: content,
          ),
        ),
      );
    },
  );
}
