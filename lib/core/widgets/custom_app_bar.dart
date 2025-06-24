import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

AppBar buildCustomAppBar(BuildContext context, {required String title}) {
    return AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          title,
          style: AppStyles.textRegular24(
            context,
          ).copyWith(color: AppColors.white),
        ),
      );
  }