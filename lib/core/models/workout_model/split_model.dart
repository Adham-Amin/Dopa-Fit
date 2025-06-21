import 'package:dopa_fit/core/models/workout_model/exercise_model.dart';

class SplitModel {
  final String name;
  final List<ExerciseModel> workout;

  SplitModel({
    required this.name,
    required this.workout,
  });

  factory SplitModel.fromFirestore(Map<String, dynamic> data, List<ExerciseModel> workouts) {
    return SplitModel(
      name: data['name'],
      workout: workouts,
    );
  }
}
