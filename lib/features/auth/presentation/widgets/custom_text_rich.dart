import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomTestRich extends StatelessWidget {
  const CustomTestRich({super.key, required this.title, required this.subtitle, this.onTap});

  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: title,
            style: AppStyles.textMedium16(
              context,
            ).copyWith(color: AppColors.white, fontSize: 14),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: subtitle,
            style: AppStyles.textMedium16(
              context,
            ).copyWith(color: AppColors.orange, fontSize: 14),
          ),
          TextSpan(
            text: '.',
            style: AppStyles.textMedium16(
              context,
            ).copyWith(color: AppColors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}