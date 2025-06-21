import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dopa_fit/core/models/diet_model/diet_model.dart';
import 'package:dopa_fit/core/models/diet_model/meal_item_model.dart';
import 'package:dopa_fit/core/models/diet_model/meal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'diet_state.dart';

class DietCubit extends Cubit<DietState> {
  DietCubit() : super(DietInitial());

  late double calories;
  late String planId;
  Future<void> fetchDiet() async {
    emit(DietLoading());
    getPlan();
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

  void getPlan() {
     if (calories >= 1500 && calories < 1750) {
      planId = 'plan 1500';
    } else if (calories >= 1750 && calories < 2000) {
      planId = 'plan 1750';
    } else if (calories >= 2000 && calories < 2250) {
      planId = 'plan 2000';
    } else if (calories >= 2250 && calories < 2500) {
      planId = 'plan 2250';
    } else if (calories >= 2500 && calories < 2750) {
      planId = 'plan 2500';
    } else if (calories >= 2750 && calories < 3000) {
      planId = 'plan 2750';
    } else if (calories >= 3000 && calories < 3250) {
      planId = 'plan 3000';
    } else if (calories >= 3250 && calories < 3500) {
      planId = 'plan 3250';
    } else if (calories >= 3500) {
      planId = 'plan 3500';
    }
  }
}
