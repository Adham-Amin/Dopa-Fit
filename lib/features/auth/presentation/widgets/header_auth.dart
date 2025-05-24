import 'package:dopa_fit/core/utils/app_assets.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({super.key, required this.subtitle});

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100),
        Image.asset(AppAssets.imagesLogo, width: 100),
        SizedBox(height: 60),
        Text(
          'Sign In To DOPAFIT',
          style: AppStyles.textBold30(context).copyWith(color: AppColors.white),
        ),
        SizedBox(height: 8),
        Text(
          subtitle,
          style: AppStyles.textRegular16(
            context,
          ).copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}