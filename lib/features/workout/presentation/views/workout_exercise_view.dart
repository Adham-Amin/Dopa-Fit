import 'package:dopa_fit/core/models/workout_model/split_model.dart';
import 'package:dopa_fit/features/workout/presentation/widgets/workout_exercise_view_body.dart';
import 'package:flutter/material.dart';

class WorkoutExerciseView extends StatelessWidget {
  const WorkoutExerciseView({super.key, required this.split});

  static const routeName = '/workoutExerciseView';
  final SplitModel split;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: WorkoutExerciseViewBody(split: split)),
    );
  }
}