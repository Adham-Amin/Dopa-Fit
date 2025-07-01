import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/features/diet/data/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                width: 35.w,
                height: 2.h,
                margin: EdgeInsets.only(bottom: 16.h),
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            Text(meal.name, style: AppStyles.textSemiBold24(context).copyWith(color: AppColors.white)),
            SizedBox(height: 12.h),
            Divider(thickness: 1, color: AppColors.red),
            SizedBox(height: 16.h),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: meal.items.length,
              separatorBuilder: (_, __) => SizedBox(height: 8.h),
              itemBuilder: (context, index) {
                final item = meal.items[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: AppColors.black,
                  ),
                  child: ListTile(
                    title: Text(
                      item.food,
                      style: AppStyles.textSemiBold16(
                        context,
                      ).copyWith(color: AppColors.white),
                    ),
                    trailing: Text(
                      item.weight,
                      style: AppStyles.textRegular14(
                        context,
                      ).copyWith(color: AppColors.white),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
