import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class WorkoutSplitInfo extends StatelessWidget {
  const WorkoutSplitInfo({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: AppStyles.textMedium20(
            context,
          ).copyWith(color: AppColors.white),
        ),
        subtitle: Text(
          subTitle,
          style: AppStyles.textLight14(
            context,
          ).copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}