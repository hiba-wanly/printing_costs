import 'package:hive/hive.dart';
part 'other_model.g.dart';

@HiveType(typeId: 2)
class Other{
  @HiveField(0)
  dynamic gain;//ربح
  @HiveField(1)
  dynamic cost_gain ; //ربح التكلفة
  @HiveField(2)
  dynamic risk;//مخاطرة
  @HiveField(3)
  dynamic cost_risk ;//مخاطرة التكلفة
  @HiveField(4)
  dynamic id;
  @HiveField(5)
  dynamic userid;

  Other({
    this.gain,
    required this.cost_gain,
    this.risk,
    required this.cost_risk
  });

  Map<String,dynamic> toJson(){
    return {
      // "id" : this.id,
      "gain" : this.cost_gain,
      "risk" : this.cost_risk
    };
  }

  Other.fromJson(Map<String ,dynamic> json) {
    id = json['id'];
    cost_gain = json['gain'];
    cost_risk = json['risk'];
    userid = json['user'];
  }

}