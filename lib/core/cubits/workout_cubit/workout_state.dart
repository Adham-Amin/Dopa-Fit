part of 'workout_cubit.dart';

abstract class WorkoutState {}

final class WorkoutInitial extends WorkoutState {}
final class WorkoutLoading extends WorkoutState {}
final class WorkoutLoaded extends WorkoutState {
  final WorkoutModel workout;
  WorkoutLoaded({required this.workout});
}
final class WorkoutError extends WorkoutState {
  final String message;
  WorkoutError({required this.message});
}
