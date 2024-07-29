import 'package:hive/hive.dart';
part 'user_material_model.g.dart';

@HiveType(typeId: 5)
class UserMaterials{
  @HiveField(0)
  dynamic id;
  @HiveField(1)
  String? material;// المادة
  @HiveField(2)
  String? unit;// الواحدة
  @HiveField(3)
  dynamic price;// تكلفة العبوة
  @HiveField(4)
  dynamic  number_of_units;//عدد الواحدات
  @HiveField(5)
  dynamic cost_per_One;// تكلفة الواحدة
  @HiveField(6)
  dynamic userid;
  @HiveField(7)
  dynamic color;
  @HiveField(8)
  dynamic brand;
  @HiveField(9)
  dynamic owner;


  UserMaterials({
    this.id,
    required this.material,
    required this.unit,
    required this.price,
    required this.number_of_units,
    this.cost_per_One,
    this.color,
    this.brand,
    this.owner
    // required this.cost_per_one
  });


  Map<String,dynamic> toJson(){
    return {
      // "id":this.id,
      "name":material,
      "unit":unit,
      "price":price,
      "number_of_units":number_of_units,
      "color":color,
      "brand":brand,
      "owner":owner,
      // "cost_per_One":this.cost_per_One,//cost_per_one()
    };
  }

  UserMaterials.fromJson(Map<String ,dynamic> json) {
    id = json['id'];
    material=json['name'];
    unit=json['unit'];
    price=json['price'];
    number_of_units=json['number_of_units'];
    cost_per_One=json['cost_per_One'];
    userid = json['user'];
    color=json['color'];
    brand=json['brand'];
    owner=json['owner'];
  }

}