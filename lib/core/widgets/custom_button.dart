import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.icon,
    required this.onTap, this.iconWidget,
  });

  final String title;
  final String? icon;
  final VoidCallback onTap;
  final Widget? iconWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: AppColors.white,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        label: iconWidget ?? SvgPicture.asset(icon!, width: 24.w),
        icon: Text(
          title,
          style: AppStyles.textSemiBold16(
            context,
          ).copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
