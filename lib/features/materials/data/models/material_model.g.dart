// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MaterialsAdapter extends TypeAdapter<Materials> {
  @override
  final int typeId = 1;

  @override
  Materials read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Materials(
      id: fields[0] as dynamic,
      material: fields[1] as String?,
      unit: fields[2] as String?,
      price: fields[3] as dynamic,
      number_of_units: fields[4] as dynamic,
      cost_per_One: fields[5] as dynamic,
      color: fields[6] as dynamic,
      brand: fields[7] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Materials obj) {
    writer
      ..writeByte(8)
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
      ..write(obj.color)
      ..writeByte(7)
      ..write(obj.brand);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MaterialsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
