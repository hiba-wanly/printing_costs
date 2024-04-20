// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_printer_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserPrintersAdapter extends TypeAdapter<UserPrinters> {
  @override
  final int typeId = 6;

  @override
  UserPrinters read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserPrinters(
      id: fields[0] as dynamic,
      printer_name: fields[1] as String?,
      preparation_cost: fields[2] as dynamic,
      start_up_cost: fields[3] as dynamic,
      Printer_wear_and_tear: fields[4] as dynamic,
      depreciation_in_hours: fields[5] as dynamic,
      courier_depreciationP: fields[6] as dynamic,
      inverter_and_battery_wear: fields[7] as dynamic,
      kilowatts_old: fields[8] as dynamic,
      Price_per_kilowatt_with_depreciationP: fields[9] as dynamic,
      Electricity_courier: fields[10] as dynamic,
      Electricity_costsP: fields[11] as dynamic,
      Courier_printingP: fields[12] as dynamic,
      Single_material: fields[13] as dynamic,
      Termination_costs: fields[14] as dynamic,
      Supervision_costs: fields[15] as dynamic,
    )..userid = fields[16] as dynamic;
  }

  @override
  void write(BinaryWriter writer, UserPrinters obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.printer_name)
      ..writeByte(2)
      ..write(obj.preparation_cost)
      ..writeByte(3)
      ..write(obj.start_up_cost)
      ..writeByte(4)
      ..write(obj.Printer_wear_and_tear)
      ..writeByte(5)
      ..write(obj.depreciation_in_hours)
      ..writeByte(6)
      ..write(obj.courier_depreciationP)
      ..writeByte(7)
      ..write(obj.inverter_and_battery_wear)
      ..writeByte(8)
      ..write(obj.kilowatts_old)
      ..writeByte(9)
      ..write(obj.Price_per_kilowatt_with_depreciationP)
      ..writeByte(10)
      ..write(obj.Electricity_courier)
      ..writeByte(11)
      ..write(obj.Electricity_costsP)
      ..writeByte(12)
      ..write(obj.Courier_printingP)
      ..writeByte(13)
      ..write(obj.Single_material)
      ..writeByte(14)
      ..write(obj.Termination_costs)
      ..writeByte(15)
      ..write(obj.Supervision_costs)
      ..writeByte(16)
      ..write(obj.userid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserPrintersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
