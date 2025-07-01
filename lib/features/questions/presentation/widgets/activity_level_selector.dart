import 'package:flutter/material.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityLevelSelector extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onSelected;

  const ActivityLevelSelector({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What is your activity level?',
          style: AppStyles.textRegular16(context),
        ),
        const SizedBox(height: 16),
        Row(
          children:
              ['low', 'moderate', 'high'].map((level) {
                String label = level[0].toUpperCase() + level.substring(1);
                return Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 4.w,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            selected == level
                                ? AppColors.red
                                : Colors.transparent,
                        foregroundColor: AppColors.white,
                        side: const BorderSide(color: AppColors.red),
                        elevation: 0,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                      ),
                      onPressed: () => onSelected(level),
                      child: Text(
                        label,
                        style: AppStyles.textRegular14(context),
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
