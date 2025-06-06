import 'package:flutter/material.dart';

abstract class AppStyles {
  static const String fontFamily = 'WorkSans';
  static TextStyle textSemiBold18(context) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle textSemiBold16(context) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle textBold30(context) {
    return TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle textBold14(context) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle textBold20(context) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle textRegular16(context) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
  }
  static TextStyle textMedium16(context) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle textSemiBold14(context) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle textRegular14(context) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }
}