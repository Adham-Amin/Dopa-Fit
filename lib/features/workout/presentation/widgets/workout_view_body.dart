import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/features/workout/presentation/widgets/custom_list_workout.dart';
import 'package:flutter/material.dart';

class WorkoutViewBody extends StatelessWidget {
  const WorkoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 12),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.dark,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.all(24),
              child: CustomListWorkout(),
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}