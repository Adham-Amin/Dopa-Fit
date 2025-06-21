import 'package:flutter/material.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';

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
          style: AppStyles.textRegular16(context).copyWith(color: AppColors.white),
        ),
        const SizedBox(height: 16),
        ...goals.map((item) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 12),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: selected == item['value'] ? AppColors.darkRed : Colors.transparent,
                foregroundColor: AppColors.white,
                side: const BorderSide(color: AppColors.orange),
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
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
