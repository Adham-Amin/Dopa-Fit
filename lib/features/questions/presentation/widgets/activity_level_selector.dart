import 'package:flutter/material.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';

class ActivityLevelSelector extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onSelected;

  const ActivityLevelSelector({super.key, required this.selected, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'What is your activity level?',
          style: AppStyles.textRegular16(context).copyWith(color: AppColors.white),
        ),
        const SizedBox(height: 16),
        ...['low', 'medium', 'high'].map((level) {
          String label = level[0].toUpperCase() + level.substring(1);
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 12),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: selected == level ? AppColors.red : Colors.transparent,
                foregroundColor: AppColors.white,
                side: const BorderSide(color: AppColors.red),
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () => onSelected(level),
              child: Text(label, style: AppStyles.textRegular14(context)),
            ),
          );
        }),
      ],
    );
  }
}
