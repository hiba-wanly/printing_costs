// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginAdapter extends TypeAdapter<Login> {
  @override
  final int typeId = 4;

  @override
  Login read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Login(
      id: fields[0] as dynamic,
      email: fields[1] as dynamic,
      password: fields[4] as dynamic,
      first_name: fields[2] as dynamic,
      last_name: fields[3] as dynamic,
      image: fields[6] as File?,
    )..imagepath = fields[5] as String?;
  }

  @override
  void write(BinaryWriter writer, Login obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.first_name)
      ..writeByte(3)
      ..write(obj.last_name)
      ..writeByte(4)
      ..write(obj.password)
      ..writeByte(5)
      ..write(obj.imagepath)
      ..writeByte(6)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
