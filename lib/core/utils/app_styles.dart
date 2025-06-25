import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  static const String fontFamily = 'WorkSans';
  static TextStyle textSemiBold18(context) {
    return TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle textSemiBold16(context) {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle textBold30(context) {
    return TextStyle(
      fontSize: 30.sp,
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle textBold14(context) {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle textBold20(context) {
    return TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle textRegular16(context) {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
    );
  }
  static TextStyle textRegular24(context) {
    return TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w400,
    );
  }
  static TextStyle textRegular10(context) {
    return TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
    );
  }
  static TextStyle textMedium16(context) {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle textMedium20(context) {
    return TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle textLight14(context) {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w300,
    );
  }
  static TextStyle textSemiBold14(context) {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle textSemiBold24(context) {
    return TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle textRegular14(context) {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    );
  }
}