import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/core/widgets/custom_container.dart';
import 'package:dopa_fit/features/diet/data/models/meal_response_model.dart';
import 'package:flutter/material.dart';

class MacrosRow extends StatelessWidget {
  final MealResponseModel meal;

  const MacrosRow({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _MacroItem(label: 'Carbs', value: meal.carbs.toString()),
          _MacroItem(label: 'Protein', value: meal.protein.toString()),
          _MacroItem(label: 'Fat', value: meal.fat.toString()),
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
        Text(label, style: AppStyles.textSemiBold14(context)),
        Text(value, style: AppStyles.textSemiBold14(context)),
      ],
    );
  }
}