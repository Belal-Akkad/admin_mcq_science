
import 'package:admin_quiz/core/constants/app_color.dart';
import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/functions/get_screen_height.dart';
import 'package:admin_quiz/core/functions/get_screen_width.dart';
import 'package:admin_quiz/core/functions/show_snack_bar.dart';
import 'package:admin_quiz/core/utilities/app_styles.dart';
import 'package:admin_quiz/features/home/presentation/manager/sign_out_cubit/sign_out_cubit.dart';
import 'package:admin_quiz/features/home/presentation/manager/sign_out_cubit/sign_out_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CustomHomeAppBarAction extends StatelessWidget {
  const CustomHomeAppBarAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignOutCubit, SignOutState>(
      listener: (context, state) {
        if (state is SignOutFailState) {
          showSnackBar(context,
              titleText: 'فشلت العملية', messageText: state.errMessage);
        }
      },
      child: PopupMenuButton(
        constraints: BoxConstraints.tightFor(
          width: getResponsiveSize(
            context,
            170,
          ),
        ),
        padding: EdgeInsets.zero,
        menuPadding: EdgeInsets.zero,
        iconSize: getResponsiveSize(context, 28),
        offset: Offset(
            getScreenWidth(context) * 0.04, getScreenHeight(context) * 0.05),
        color: AppColor.kWhiteColor,
        elevation: 2,
        iconColor: AppColor.kWhiteColor,
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
              onTap: () {
                BlocProvider.of<SignOutCubit>(context).signOut();
              },
              child: Center(
                child: Text(
                  textAlign: TextAlign.right,
                  'تسجيل خروج',
                  style: AppStyles.noramalTextStyle18(context)
                      .copyWith(color: Colors.black),
                ),
              ),
            ),
          ];
        },
      ),
    );
  }
}
