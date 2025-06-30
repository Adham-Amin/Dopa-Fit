import 'package:dopa_fit/features/diet/data/models/diet_input_model.dart';
import 'package:dopa_fit/features/diet/data/models/meal_response_model.dart';
import 'package:dopa_fit/features/diet/data/repos/diet_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
part 'diet_state.dart';

class DietCubit extends Cubit<DietState> {
  DietCubit({required this.dietRepo}) : super(DietInitial());

  final DietRepo dietRepo;

  Future<void> getMeals({
    DietInputModel? dietInput,
    bool forceRefresh = false,
  }) async {
    emit(DietLoading());

    try {
      final box = Hive.box<MealResponseModel>('dietBox');

      if (!forceRefresh) {
        final cached = box.get('lastResponse');

        if (cached != null) {
          emit(DietLoaded(diets: cached));
          return;
        }
      }

      final result = await dietRepo.getMeals(dietInput: dietInput!);

      result.fold(
        (failure) {
          emit(DietError(message: failure.message));
        },
        (meals) async {
          await box.put('lastResponse', meals);
          emit(DietLoaded(diets: meals));
        },
      );
    } catch (e) {
      emit(DietError(message: e.toString()));
    }
  }
}
