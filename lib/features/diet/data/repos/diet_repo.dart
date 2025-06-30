import 'package:dartz/dartz.dart';
import 'package:dopa_fit/core/errors/failure.dart';
import 'package:dopa_fit/features/diet/data/models/diet_input_model.dart';
import 'package:dopa_fit/features/diet/data/models/meal_response_model.dart';

abstract class DietRepo {
  Future<Either<Failure, MealResponseModel>> getMeals({
    required DietInputModel dietInput,
  });
}
