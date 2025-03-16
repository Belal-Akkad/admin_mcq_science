import 'package:admin_quiz/core/constants/app_color.dart';
import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomModalProgressHUD extends StatelessWidget {
  const CustomModalProgressHUD(
      {super.key, required this.child, required this.inAsyncCall});
  final Widget child;
  final bool inAsyncCall;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: SizedBox(
        height: getResponsiveSize(context, 40),
        width: getResponsiveSize(context, 40),
        child: CircularProgressIndicator(
          strokeWidth: getResponsiveSize(context, 4),
          color: AppColor.kWhiteColor,
        ),
      ),
      inAsyncCall: inAsyncCall,
      color: AppColor.kBlueGrayColor,
      child: child,
    );
  }
}
