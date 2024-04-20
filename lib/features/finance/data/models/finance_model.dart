
import 'package:hive/hive.dart';
part 'finance_model.g.dart';
@HiveType(typeId: 0)
class Finance {
  @HiveField(0)
  dynamic num ;// الصرف
  @HiveField(1)
  dynamic id;
  @HiveField(2)
  dynamic userid;
  Finance({required this.num});

  Map<String,dynamic> toJson(){
    return {
      "id" : this.id,
      "coins" : this.num
    };
  }

  Finance.fromJson(Map<String ,dynamic> json) {
    id = json['id'];
    num = json['coins'];
    userid = json['user'];
  }
}
