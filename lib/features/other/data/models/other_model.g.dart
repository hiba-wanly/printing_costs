// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OtherAdapter extends TypeAdapter<Other> {
  @override
  final int typeId = 2;

  @override
  Other read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Other(
      gain: fields[0] as dynamic,
      cost_gain: fields[1] as dynamic,
      risk: fields[2] as dynamic,
      cost_risk: fields[3] as dynamic,
    )
      ..id = fields[4] as dynamic
      ..userid = fields[5] as dynamic;
  }

  @override
  void write(BinaryWriter writer, Other obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.gain)
      ..writeByte(1)
      ..write(obj.cost_gain)
      ..writeByte(2)
      ..write(obj.risk)
      ..writeByte(3)
      ..write(obj.cost_risk)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.userid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OtherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
