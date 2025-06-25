import 'package:flutter/material.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoalSelector extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onSelected;

  const GoalSelector({super.key, required this.selected, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final goals = [
      {'value': 'lose', 'label': 'Lose Weight'},
      {'value': 'maintain', 'label': 'Maintain Weight'},
      {'value': 'gain', 'label': 'Gain Weight'},
    ];

    return Column(
      children: [
        Text(
          'What is your goal?',
          style: AppStyles.textRegular16(context),
        ),
         SizedBox(height: 16.h),
        ...goals.map((item) {
          return Container(
            width: double.infinity,
            margin:  EdgeInsets.only(bottom: 12.h),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: selected == item['value'] ? AppColors.red : Colors.transparent,
                foregroundColor: AppColors.white,
                side: const BorderSide(color: AppColors.red),
                elevation: 0,
                padding:  EdgeInsets.symmetric(vertical: 14.h),
              ),
              onPressed: () => onSelected(item['value']!),
              child: Text(item['label']!, style: AppStyles.textRegular14(context)),
            ),
          );
        }),
      ],
    );
  }
}
