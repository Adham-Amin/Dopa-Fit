import 'package:dopa_fit/core/models/diet_model/meal_model.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class MealBottomSheet extends StatelessWidget {
  final MealModel meal;

  const MealBottomSheet({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
                  child: Container(
                    width: 35,
                    height: 2,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
            Text(
              meal.name,
              style: AppStyles.textSemiBold24(
                context,
              ).copyWith(color: AppColors.white),
            ),
            const SizedBox(height: 12),
            Divider(thickness: 1, color: AppColors.orange),
            const SizedBox(height: 16),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: meal.items.length,
              separatorBuilder: (_, __) => SizedBox(height: 8),
              itemBuilder: (context, index) {
                final item = meal.items[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.black,
                  ),
                  child: ListTile(
                    title: Text(
                      item.name,
                      style: AppStyles.textSemiBold16(
                        context,
                      ).copyWith(color: AppColors.white),
                    ),
                    trailing: Text(
                      item.quantity,
                      style: AppStyles.textRegular14(
                        context,
                      ).copyWith(color: AppColors.white),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
