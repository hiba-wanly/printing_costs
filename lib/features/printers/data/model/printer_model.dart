import 'package:hive/hive.dart';
part 'printer_model.g.dart';

@HiveType(typeId: 3)
class Printers {
  @HiveField(0)
  dynamic id;
  @HiveField(1)
  String? printer_name; // نوع الطابعة
  @HiveField(2)
  dynamic preparation_cost; // كلفة التحضير
  @HiveField(3)
  dynamic start_up_cost; //كلفة بداية
  @HiveField(4)
  dynamic Printer_wear_and_tear  ; //اهتلاك الطابعة
  @HiveField(5)
  dynamic depreciation_in_hours  ; //اهتلاكها بالساعات
  @HiveField(6)
  dynamic courier_depreciationP;//اهتلاك ساعي
  @HiveField(7)
  dynamic  inverter_and_battery_wear; //اهتلاك انفرتر و بطارية
  @HiveField(8)
  dynamic kilowatts_old;//كيلوواط عمرها
  @HiveField(9)
  dynamic Price_per_kilowatt_with_depreciationP;//سعرالكيلو الواط مع اهتلاك
  @HiveField(10)
  dynamic Electricity_courier;//كهرباء ساعي
  @HiveField(11)
  dynamic Electricity_costsP;//تكاليف كهرباء
  @HiveField(12)
  dynamic Courier_printingP;//طباعة ساعية
  @HiveField(13)
  dynamic Single_material;//واحدة المواد
  @HiveField(14)
  dynamic Termination_costs;//تكاليف إنهاء
  @HiveField(15)
  dynamic Supervision_costs;//تكاليف إشراف

  Printers({
     this.id,
    required this.printer_name,
    required this.preparation_cost,
    required this.start_up_cost,
    required this.Printer_wear_and_tear,
    required this.depreciation_in_hours,
    this.courier_depreciationP,
    required this.inverter_and_battery_wear,
    required this.kilowatts_old,
    this.Price_per_kilowatt_with_depreciationP,
    required this.Electricity_courier,
    this.Electricity_costsP,
    this.Courier_printingP,
    required this.Single_material,
    required this.Termination_costs,
    required this.Supervision_costs
  });

// double courier_depreciation () {
//   return Printer_wear_and_tear / depreciation_in_hours;
// }
//
// double Price_per_kilowatt_with_depreciation(){
//   return (inverter_and_battery_wear/kilowatts_old)+0.03;
// }
//
// double  Electricity_costs(){
//   return  Electricity_courier * Price_per_kilowatt_with_depreciation();
// }
//
// double Courier_printing(){
//   return Electricity_costs() + courier_depreciation();
// }

  Map<String,dynamic> toJson(){
    return{
      // "id": this.id,
      "name":this.printer_name,
      "preparation_cost":this.preparation_cost,
      "start_up_cost":this.start_up_cost,
      "printer_wear_and_tear":this.Printer_wear_and_tear,
      "depreciation_in_hours":this.depreciation_in_hours,
      // "courier_depreciation": this.courier_depreciationP,//courier_depreciation(),
      "inverter_and_battery_wear":this.inverter_and_battery_wear,
      "kilowatts_old":this.kilowatts_old,
      // "price_per_kilowatt_with_depreciation":this.Price_per_kilowatt_with_depreciationP,//this.Price_per_kilowatt_with_depreciation(),
      "electricity_courier":this.Electricity_courier,
      // "electricity_costs":this.Electricity_costsP,//Electricity_costs(),
      // "courier_printing":this.Courier_printingP,//Courier_printing(),
      "single_material":this.Single_material,
      "termination_costs":Termination_costs,
      "supervision_costs":Supervision_costs,
    };
  }

  Printers.fromJson(Map<String ,dynamic> json) {
    id = json['id'];
    printer_name = json['name'];
    preparation_cost = json['preparation_cost'];
    start_up_cost = json['start_up_cost'];
    Printer_wear_and_tear = json['printer_wear_and_tear'];
    depreciation_in_hours= json['depreciation_in_hours'];
    courier_depreciationP = json['courier_depreciation'];
    inverter_and_battery_wear = json['inverter_and_battery_wear'];
    kilowatts_old = json['kilowatts_old'];
    Price_per_kilowatt_with_depreciationP = json['price_per_kilowatt_with_depreciation'];
    Electricity_courier = json['electricity_courier'];
    Electricity_costsP = json['electricity_costs'];
    Courier_printingP = json['courier_printing'];
    Single_material = json['single_material'];
    Termination_costs = json['termination_costs'];
    Supervision_costs = json['supervision_costs'];
  }

}