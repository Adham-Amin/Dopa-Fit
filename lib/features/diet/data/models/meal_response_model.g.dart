// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealResponseModelAdapter extends TypeAdapter<MealResponseModel> {
  @override
  final int typeId = 0;

  @override
  MealResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealResponseModel(
      calories: fields[0] as num,
      protein: fields[1] as num,
      fat: fields[2] as num,
      carbs: fields[3] as num,
      meals: (fields[4] as List).cast<MealModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, MealResponseModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.calories)
      ..writeByte(1)
      ..write(obj.protein)
      ..writeByte(2)
      ..write(obj.fat)
      ..writeByte(3)
      ..write(obj.carbs)
      ..writeByte(4)
      ..write(obj.meals);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
