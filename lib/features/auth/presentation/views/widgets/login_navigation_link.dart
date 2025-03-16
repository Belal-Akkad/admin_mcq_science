import 'package:admin_quiz/core/constants/app_color.dart';
import 'package:admin_quiz/core/utilities/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginNavigationLink extends StatelessWidget {
  const LoginNavigationLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'إذا كان لديك حساب ',
          style: AppStyles.boldTextStyle14(context),
        ),
        GestureDetector(
          onTap: () {
            Get.back();
            FocusScope.of(context).unfocus();
          },
          child: Text(
            'اضغط لتسجيل الدخول',
            style: AppStyles.boldTextStyle14(context).copyWith(
              color: AppColor.kTurquoiseColor,
            ),
          ),
        )
      ],
    );
  }
}
