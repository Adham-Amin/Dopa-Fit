// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealItemModelAdapter extends TypeAdapter<MealItemModel> {
  @override
  final int typeId = 2;

  @override
  MealItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealItemModel(
      food: fields[0] as String,
      weight: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MealItemModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.food)
      ..writeByte(1)
      ..write(obj.weight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
