import 'package:dopa_fit/core/functions/get_user.dart';
import 'package:dopa_fit/features/profile/presentation/widgets/personal_info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInfoViewBody extends StatelessWidget {
  const PersonalInfoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final user = getUser();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),
            PersonalInfoItem(labal: 'Name', value: user.name),
            SizedBox(height: 12.h),
            PersonalInfoItem(labal: 'Email', value: user.email),
            SizedBox(height: 12.h),
            Row(
              spacing: 12.w,
              children: [
                Expanded(
                  child: PersonalInfoItem(
                    labal: 'Height',
                    value: user.height.toString(),
                  ),
                ),
                Expanded(
                  child: PersonalInfoItem(
                    labal: 'Weight',
                    value: user.weight.toString(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            PersonalInfoItem(labal: 'Calories', value: '${user.calories} kcal'),
            SizedBox(height: 12.h),
            PersonalInfoItem(
              labal: 'Workout Split',
              value: user.workoutPlanId.toString(),
            ),
          ],
        ),
      ),
    );
  }
}