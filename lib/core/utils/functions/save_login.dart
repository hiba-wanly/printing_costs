import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:printing_costs_2/features/login/data/models/login_model.dart';

void saveLoginData(Login login, String boxName){
  var box = Hive.box<Login>(boxName);
  box.clear();
  box.add(login);
}
void deleteLoginData( String boxName){
  var box = Hive.box<Login>(boxName);
  box.clear();
  debugPrint(box.toString());
}
