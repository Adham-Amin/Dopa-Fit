import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomWorkoutItem extends StatelessWidget {
  const CustomWorkoutItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(8.r),
        ),
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(16),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            title,
            style: AppStyles.textMedium20(
              context,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: AppStyles.textLight14(
              context,
            ),
          ),
          trailing: Icon(
            Icons.arrow_circle_right_outlined,
            color: AppColors.red,
            size: 32.w,
          ),
        ),
      ),
    );
  }
}