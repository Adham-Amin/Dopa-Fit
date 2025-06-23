import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/core/widgets/custom_container.dart';
import 'package:flutter/material.dart';

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
              ).copyWith(color: AppColors.white),
            ),
            const SizedBox(height: 10),
            Icon(icon, size: 60, color: AppColors.white),
          ],
        ),
      ),
    );
  }
}