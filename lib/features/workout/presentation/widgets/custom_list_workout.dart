import 'package:dopa_fit/core/cubits/workout_cubit/workout_cubit.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/features/workout/presentation/views/workout_exercise_view.dart';
import 'package:dopa_fit/features/workout/presentation/widgets/custom_workout_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListWorkout extends StatelessWidget {
  const CustomListWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutCubit, WorkoutState>(
      builder: (context, state) {
        if (state is WorkoutLoaded) {
          return ListView.builder(
            itemCount: state.workout.exercises.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder:
                (context, index) => CustomWorkoutItem(
                  onTap:
                      () => Navigator.pushNamed(
                        context,
                        WorkoutExerciseView.routeName,
                        arguments: state.workout.exercises[index],
                      ),
                  title: state.workout.exercises[index].name,
                  subtitle:
                      '${state.workout.exercises[index].workout.length} Exercises',
                ),
          );
        } else if (state is WorkoutError) {
          return Center(
            child: Text(
              state.message,
              style: AppStyles.textSemiBold14(
                context,
              ).copyWith(color: AppColors.white),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator(color: AppColors.red,));
        }
      },
    );
  }
}
