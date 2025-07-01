import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dopa_fit/core/errors/failure.dart';
import 'package:dopa_fit/features/diet/data/models/diet_input_model.dart';
import 'package:dopa_fit/features/diet/data/models/meal_response_model.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import 'diet_repo.dart';

class DietRepoImpl extends DietRepo {
  final String baseUrl = 'http://192.168.1.10:5000/api/analyze';

  @override
  Future<Either<Failure, MealResponseModel>> getMeals({
    required DietInputModel dietInput,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(dietInput.toJson()),
      );

      if (response.statusCode == 200) {
        final result = MealResponseModel.fromJson(json.decode(response.body));

        final box = Hive.box<MealResponseModel>('dietBox');
        await box.put('lastResponse', result);

        return Right(result);
      } else {
        return Left(ServerFailure(message: response.body));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
