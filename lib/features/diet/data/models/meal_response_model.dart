import 'package:hive/hive.dart';
import 'meal_model.dart';

part 'meal_response_model.g.dart';

@HiveType(typeId: 0)
class MealResponseModel extends HiveObject {
  @HiveField(0)
  final num calories;

  @HiveField(1)
  final num protein;

  @HiveField(2)
  final num fat;

  @HiveField(3)
  final num carbs;

  @HiveField(4)
  final List<MealModel> meals;

  MealResponseModel({
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbs,
    required this.meals,
  });

  factory MealResponseModel.fromJson(Map<String, dynamic> json) {
    return MealResponseModel(
      calories: json['calories'],
      protein: json['protein'],
      fat: json['fat'],
      carbs: json['carbs'],
      meals: List<MealModel>.from(
        json['meals'].map((meal) => MealModel.fromJson(meal)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'calories': calories,
      'protein': protein,
      'fat': fat,
      'carbs': carbs,
      'meals': meals.map((m) => m.toJson()).toList(),
    };
  }
}
