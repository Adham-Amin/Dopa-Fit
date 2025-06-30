part of 'diet_cubit.dart';

sealed class DietState extends Equatable {
  const DietState();

  @override
  List<Object> get props => [];
}

final class DietInitial extends DietState {}
final class DietLoaded extends DietState {
  final MealResponseModel diets;
  const DietLoaded({required this.diets});
}
final class DietError extends DietState {
  final String message;
  const DietError({required this.message});
}
final class DietLoading extends DietState {}
