import 'package:admin_quiz/core/constants/app_color.dart';
import 'package:admin_quiz/core/constants/app_font.dart';
import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  // static TextStyle boldTextStyle70(BuildContext context) => TextStyle(
  //       fontSize: getResponsiveSize(context, 70),
  //       color: AppColor.kGrayColor,
  //       fontWeight: FontWeight.bold,
  //     );
  static TextStyle boldTextStayle30(BuildContext context) => TextStyle(
        fontSize: getResponsiveSize(context, 30),
        color: AppColor.kWhiteColor,
        fontFamily: AppFont.kLoraFont,
        fontWeight: FontWeight.bold,
      );

  static TextStyle boldTextStyle22(BuildContext context) => TextStyle(
        fontSize: getResponsiveSize(context, 22),
        color: AppColor.kBlackColor,
        fontWeight: FontWeight.bold,
      );

  // static TextStyle boldTextStayle20(BuildContext context) => TextStyle(
  //       fontSize: getResponsiveSize(context, 20),
  //       color: AppColor.kWhiteColor,
  //       fontFamily: AppFont.kLoraFont,
  //       fontWeight: FontWeight.bold,
  //     );

  static TextStyle boldTextStyle16(BuildContext context) => TextStyle(
        fontSize: getResponsiveSize(context, 16),
        color: AppColor.kWhiteColor,
        fontFamily: AppFont.kLoraFont,
        fontWeight: FontWeight.bold,
      );
  static TextStyle boldTextStyle14(BuildContext context) => TextStyle(
        fontSize: getResponsiveSize(context, 14),
        color: AppColor.kWhiteColor,
        fontFamily: AppFont.kLoraFont,
        fontWeight: FontWeight.bold,
      );

  static TextStyle semiBoldTextStyle16(BuildContext context) => TextStyle(
        fontSize: getResponsiveSize(context, 16),
        color: AppColor.kWhiteColor,
        fontFamily: AppFont.kLoraFont,
        fontWeight: FontWeight.w600,
      );

  static TextStyle mediumnTextStayle30(BuildContext context) => TextStyle(
        fontSize: getResponsiveSize(context, 30),
        color: AppColor.kWhiteColor,
        fontFamily: AppFont.kLoraFont,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
      );

  static TextStyle mediumnTextStayle20(BuildContext context) => TextStyle(
        fontSize: getResponsiveSize(context, 20),
        color: AppColor.kWhiteColor,
        fontFamily: AppFont.kLoraFont,
        fontWeight: FontWeight.w500,
      );
  static TextStyle mediumTextStyle18(BuildContext context) => TextStyle(
        fontSize: getResponsiveSize(context, 14),
        color: AppColor.kWhiteColor,
        fontFamily: AppFont.kLoraFont,
        fontWeight: FontWeight.w500,
      );

  static TextStyle mediumTextStyle16(BuildContext context) => TextStyle(
        fontSize: getResponsiveSize(context, 16),
        color: AppColor.kWhiteColor,
        fontFamily: AppFont.kLoraFont,
        fontWeight: FontWeight.w500,
      );
  static TextStyle mediumTextStyle14(BuildContext context) => TextStyle(
        fontSize: getResponsiveSize(context, 14),
        color: AppColor.kRedColor,
        fontFamily: AppFont.kLoraFont,
        fontWeight: FontWeight.w500,
      );

  static TextStyle noramalTextStyle22(BuildContext context) => TextStyle(
        fontSize: getResponsiveSize(context, 22),
        fontFamily: AppFont.kLoraFont,
        color: AppColor.kWhiteColor,
      );

  static TextStyle noramalTextStyle20(BuildContext context) => TextStyle(
        fontSize: getResponsiveSize(context, 20),
        color: Colors.black.withOpacity(0.7),
        fontWeight: FontWeight.normal,
      );
  static TextStyle noramalTextStyle18(BuildContext context) => TextStyle(
        fontSize: getResponsiveSize(context, 18),
        color: AppColor.kWhiteColor,
        fontWeight: FontWeight.normal,
      );
  static TextStyle normalTextStyle16(BuildContext context) => TextStyle(
        fontSize: getResponsiveSize(context, 16),
        color: AppColor.kWhiteColor,
        fontFamily: AppFont.kLoraFont,
        fontWeight: FontWeight.normal,
      );
}
