import 'package:dopa_fit/core/models/diet_model/meal_model.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/features/diet/presentation/widgets/custom_item_diet.dart';
import 'package:dopa_fit/features/diet/presentation/widgets/meal_bottom_sheet.dart';
import 'package:flutter/material.dart';

class MealsGrid extends StatelessWidget {
  const MealsGrid({super.key, required this.meals});

  final List<MealModel> meals;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: meals.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder:
          (context, index) => CustomItemDiet(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: AppColors.dark,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                builder: (_) => MealBottomSheet(meal: meals[index]),
              );
            },
            title: meals[index].name,
            icon: Icons.restaurant_menu_rounded,
          ),
    );
  }
}
