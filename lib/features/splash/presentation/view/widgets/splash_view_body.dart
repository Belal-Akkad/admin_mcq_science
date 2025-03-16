import 'package:admin_quiz/core/constants/app_asset.dart';
import 'package:admin_quiz/core/constants/app_duration.dart';
import 'package:admin_quiz/core/constants/app_color.dart';
import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/utilities/app_styles.dart';
import 'package:admin_quiz/features/auth/presentation/views/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({
    super.key,
  });

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  double opacity = 1.0;

  @override
  void initState() {
    super.initState();
    changeOpacity();
  }

  Future<void> changeOpacity() async {
    await Future.delayed(const Duration(seconds: 1));

    if (mounted) {
      setState(() => opacity = 0);
    }

    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
      Get.off(() => const AuthGate(), transition: Transition.fade);
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedOpacity(
          opacity: opacity,
          duration: AppDuration.animatedOpacity,
          child: Container(color: AppColor.kBlackColor),
        ),
        AnimatedOpacity(
          opacity: opacity == 1 ? 0 : 1,
          duration: AppDuration.animatedOpacity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAsset.kAppIcon,
                  width: getResponsiveSize(context, 200),
                  height: getResponsiveSize(context, 200),
                ),
                SizedBox(height: getResponsiveSize(context, 30)),
                Text('Admin MCQ Science', style: AppStyles.boldTextStyle14(context)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
