import 'package:dopa_fit/core/models/workout_model/split_model.dart';

class WorkoutModel {
  final String cardio;
  final List<SplitModel> exercises;

  WorkoutModel({
    required this.cardio,
    required this.exercises,
  });

  factory WorkoutModel.fromFirestore(Map<String, dynamic> data, List<SplitModel> splits) {
    return WorkoutModel(
      cardio: data['cardio'],
      exercises: splits,
    );
  }
}
