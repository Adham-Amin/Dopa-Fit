import 'package:hive/hive.dart';
import 'package:dopa_fit/features/diet/data/models/meal_item_model.dart';

part 'meal_model.g.dart';

@HiveType(typeId: 1)
class MealModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final List<MealItemModel> items;

  MealModel({
    required this.name,
    required this.items,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
        name: json['name'],
        items: List<MealItemModel>.from(
            json['items'].map((item) => MealItemModel.fromJson(item))),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'items': items.map((e) => e.toJson()).toList(),
      };
}
