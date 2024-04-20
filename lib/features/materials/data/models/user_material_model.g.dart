// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_material_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserMaterialsAdapter extends TypeAdapter<UserMaterials> {
  @override
  final int typeId = 5;

  @override
  UserMaterials read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserMaterials(
      id: fields[0] as dynamic,
      material: fields[1] as String?,
      unit: fields[2] as String?,
      price: fields[3] as dynamic,
      number_of_units: fields[4] as dynamic,
      cost_per_One: fields[5] as dynamic,
      color: fields[7] as dynamic,
      brand: fields[8] as dynamic,
    )..userid = fields[6] as dynamic;
  }

  @override
  void write(BinaryWriter writer, UserMaterials obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.material)
      ..writeByte(2)
      ..write(obj.unit)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.number_of_units)
      ..writeByte(5)
      ..write(obj.cost_per_One)
      ..writeByte(6)
      ..write(obj.userid)
      ..writeByte(7)
      ..write(obj.color)
      ..writeByte(8)
      ..write(obj.brand);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserMaterialsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
