import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
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
        label: SvgPicture.asset(icon, width: 24),
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
