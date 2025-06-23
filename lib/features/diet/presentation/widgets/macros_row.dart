import 'package:dopa_fit/core/models/diet_model/diet_model.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/core/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class MacrosRow extends StatelessWidget {
  final DietModel diet;

  const MacrosRow({super.key, required this.diet});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _MacroItem(label: 'Carbs', value: diet.carb.toString()),
          _MacroItem(label: 'Protein', value: diet.protein.toString()),
          _MacroItem(label: 'Fat', value: diet.fat.toString()),
        ],
      ),
    );
  }
}

class _MacroItem extends StatelessWidget {
  final String label;
  final String value;

  const _MacroItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: AppStyles.textSemiBold14(context).copyWith(color: AppColors.white)),
        Text(value, style: AppStyles.textSemiBold14(context).copyWith(color: AppColors.white)),
      ],
    );
  }
}