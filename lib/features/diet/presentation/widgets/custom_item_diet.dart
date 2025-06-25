import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/core/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomItemDiet extends StatelessWidget {
  const CustomItemDiet({super.key, required this.title, required this.icon, this.onTap});

  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        child: Column(
          children: [
            Text(
              title,
              style: AppStyles.textSemiBold24(
                context,
              ),
            ),
            SizedBox(height: 10.h),
            Icon(icon, size: 60.w, color: AppColors.white),
          ],
        ),
      ),
    );
  }
}