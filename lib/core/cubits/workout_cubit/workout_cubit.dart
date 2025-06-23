import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dopa_fit/core/models/workout_model/exercise_model.dart';
import 'package:dopa_fit/core/models/workout_model/split_model.dart';
import 'package:dopa_fit/core/models/workout_model/workout_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit() : super(WorkoutInitial());


  String getWorkoutPlanId({required double weight}) {
    if (weight < 60) {
      return 'AR';
    } else if (weight < 80) {
      return 'PPL';
    } else {
      return 'UL';
    }
  }

  Future<void> fetchWorkout({required String planId}) async {
    emit(WorkoutLoading());

    try {
      final workoutModel =
          await FirebaseFirestore.instance
              .collection("Workouts")
              .doc(planId)
              .get();

      final exercises =
          await FirebaseFirestore.instance
              .collection("Workouts")
              .doc(planId)
              .collection("Exercises")
              .get();

      final splits = await Future.wait(
        exercises.docs.map((splitDoc) async {
          final exercisesSnap =
              await splitDoc.reference.collection("workout").get();
          final exercises =
              exercisesSnap.docs
                  .map(
                    (exerciseDoc) =>
                        ExerciseModel.fromFirestore(exerciseDoc.data()),
                  )
                  .toList();
          return SplitModel.fromFirestore(splitDoc.data(), exercises);
        }),
      );

      final plan = WorkoutModel.fromFirestore(workoutModel.data()!, splits);

      emit(WorkoutLoaded(workout: plan));
    } catch (e) {
      emit(WorkoutError(message: e.toString()));
    }
  }

  Future<void> updateUserWorkoutData({
    required String userId,
    required String planId,
    required double weight,
  }) async {
    try {
      await FirebaseFirestore.instance.collection("users").doc(userId).update({
        "workoutPlanId": planId,
        "weight": weight,
      });
    } catch (e) {
      emit(WorkoutError(message: 'Something went wrong'));
    }
  }
}
