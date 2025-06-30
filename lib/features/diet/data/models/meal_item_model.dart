import 'package:hive/hive.dart';

part 'meal_item_model.g.dart';

@HiveType(typeId: 2)
class MealItemModel extends HiveObject {
  @HiveField(0)
  final String food;

  @HiveField(1)
  final num weight;

  MealItemModel({required this.food, required this.weight});

  factory MealItemModel.fromJson(Map<String, dynamic> json) {
    return MealItemModel(
      food: json['food'],
      weight: json['weight'],
    );
  }

  Map<String, dynamic> toJson() => {
        'food': food,
        'weight': weight,
      };
}
