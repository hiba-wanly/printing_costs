import 'package:hive/hive.dart';
import 'package:printing_costs_2/constants.dart';
import 'package:printing_costs_2/features/login/data/models/login_model.dart';

abstract class LoginLocalDataSource {
  Login fetchLogin();
}

class LoginLocalDataSourceImpl extends LoginLocalDataSource
{


  @override
  Login fetchLogin() {
    var box = Hive.box<Login>(kLoginBox);
    // box.clear();
    return box.values.first;
  }

}