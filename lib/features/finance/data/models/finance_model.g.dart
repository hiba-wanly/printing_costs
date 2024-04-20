// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FinanceAdapter extends TypeAdapter<Finance> {
  @override
  final int typeId = 0;

  @override
  Finance read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Finance(
      num: fields[0] as dynamic,
    )
      ..id = fields[1] as dynamic
      ..userid = fields[2] as dynamic;
  }

  @override
  void write(BinaryWriter writer, Finance obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.num)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.userid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FinanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
