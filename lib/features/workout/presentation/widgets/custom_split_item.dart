import 'package:dopa_fit/core/utils/app_assets.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomSplitItem extends StatelessWidget {
  const CustomSplitItem({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyles.textLight14(
                    context,
                  ).copyWith(fontSize: 16, color: AppColors.white),
                ),
                Divider(color: Colors.red, endIndent: 100),
                Text(
                  '2 Set x 8 Reps, Rest 4 mins',
                  style: AppStyles.textRegular10(
                    context,
                  ).copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset(AppAssets.imagesPlayVideo),
          ),
        ],
      ),
    );
  }
}
