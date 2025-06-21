import 'package:dopa_fit/core/models/diet_model/meal_item_model.dart';

class MealModel {
  final String name;
  final List<MealItemModel> items;

  MealModel({required this.name, required this.items});

  factory MealModel.fromFirestore(Map<String, dynamic> json, List<MealItemModel> items) {
    return MealModel(
      name: json['name'],
      items: items,
    );
  }
}
