import 'package:admin_quiz/core/constants/app_color.dart';
import 'package:admin_quiz/core/utilities/app_styles.dart';
import 'package:admin_quiz/features/auth/presentation/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterNavigationLink extends StatelessWidget {
  const RegisterNavigationLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'إذا لم يكن لديك حساب ',
          style: AppStyles.boldTextStyle14(context),
        ),
        GestureDetector(
          onTap: () =>
              Get.to(() => const RegisterView(), transition: Transition.fade),
          child: Text(
            'اضغط لإنشاء حساب',
            style: AppStyles.boldTextStyle14(context).copyWith(
              color: AppColor.kTurquoiseColor,
            ),
          ),
        )
      ],
    );
  }
}
