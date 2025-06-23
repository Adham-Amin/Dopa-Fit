import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/core/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class CustomHomeItem extends StatelessWidget {
  const CustomHomeItem({
    super.key,
    required this.title,
    required this.image,
    this.onTap,
  });

  final String title;
  final Widget image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppStyles.textSemiBold24(
                context,
              ).copyWith(color: AppColors.white),
            ),
            image,
          ],
        ),
      ),
    );
  }
}
