import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dopa_fit/core/models/diet_model/diet_model.dart';
import 'package:dopa_fit/core/models/diet_model/meal_item_model.dart';
import 'package:dopa_fit/core/models/diet_model/meal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'diet_state.dart';

class DietCubit extends Cubit<DietState> {
  DietCubit() : super(DietInitial());

  Future<void> fetchDiet({required String planId}) async {
    emit(DietLoading());

    try {
      final diet =
          await FirebaseFirestore.instance
              .collection("Diets")
              .doc(planId)
              .get();

      final mealsSnap =
          await FirebaseFirestore.instance
              .collection("Diets")
              .doc(planId)
              .collection("meals")
              .get();

      final meals = await Future.wait(
        mealsSnap.docs.map((mealDoc) async {
          final itemsSnap = await mealDoc.reference.collection("items").get();
          final items =
              itemsSnap.docs
                  .map((itemDoc) => MealItemModel.fromFirestore(itemDoc.data()))
                  .toList();
          return MealModel.fromFirestore(mealDoc.data(), items);
        }),
      );

      final plan = DietModel.fromFirestore(diet.data()!, meals);

      emit(DietLoaded(diets: plan));
    } catch (e) {
      emit(DietError(message: e.toString()));
    }
  }

  Future<void> updateUserPlanId({required String userId, required double calories}) async {
    emit(DietLoading());
    String planId = getPlan(calories: calories);
    try {
      await FirebaseFirestore.instance.collection("users").doc(userId).update({
        "planId": planId,
      });
    } catch (e) {
      emit(DietError(message: 'Something went wrong'));
    }
  }

  String getPlan({required double calories}) {
    if (calories >= 1500 && calories < 1750) {
      return 'plan 1500';
    } else if (calories >= 1750 && calories < 2000) {
      return 'plan 1750';
    } else if (calories >= 2000 && calories < 2250) {
      return 'plan 2000';
    } else if (calories >= 2250 && calories < 2500) {
      return 'plan 2250';
    } else if (calories >= 2500 && calories < 2750) {
      return 'plan 2500';
    } else if (calories >= 2750 && calories < 3000) {
      return 'plan 2750';
    } else if (calories >= 3000 && calories < 3250) {
      return 'plan 3000';
    } else if (calories >= 3250 && calories < 3500) {
      return 'plan 3250';
    } else {
      return 'plan 3500';
    }
  }
}
