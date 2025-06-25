import 'package:dopa_fit/core/functions/launch_link.dart';
import 'package:dopa_fit/core/models/workout_model/split_model.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/features/workout/presentation/widgets/custom_split_item.dart';
import 'package:dopa_fit/features/workout/presentation/widgets/workout_split_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutExerciseViewBody extends StatelessWidget {
  const WorkoutExerciseViewBody({super.key, required this.split});

  final SplitModel split;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 12.h),
          WorkoutSplitInfo(
            title: split.name,
            subTitle: '${split.workout.length} Exercises',
          ),
          Divider(color: AppColors.red, height: 32.h),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.dark,
                borderRadius: BorderRadius.circular(16.r),
              ),
              padding: EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: split.workout.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder:
                    (context, index) => CustomSplitItem(
                      onTap: () {
                        launchLink(context, split.workout[index].url);
                      },
                      title: split.workout[index].name,
                    ),
              ),
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
