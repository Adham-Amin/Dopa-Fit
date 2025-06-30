// import 'package:dopa_fit/core/models/diet_model/meal_model.dart';

// class DietModel {
//   final String protein;
//   final String carb;
//   final String fat;
//   final List<MealModel> meals;

//   DietModel({
//     required this.protein,
//     required this.carb,
//     required this.fat,
//     required this.meals,
//   });

//   factory DietModel.fromFirestore(Map<String, dynamic> json, List<MealModel> meals) {
//     return DietModel(
//       protein: json['protein'],
//       carb: json['carb'],
//       fat: json['fat'],
//       meals: meals,
//     );
//   }
// }