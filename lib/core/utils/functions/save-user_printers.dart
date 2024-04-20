import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:printing_costs_2/features/printers/data/model/user_printer_model.dart';

void saveUserPrintersData(List<UserPrinters> printers, String boxName){
  var box = Hive.box<UserPrinters>(boxName);
  box.addAll(printers);
}

void updateUserPrintersData(List<UserPrinters> finance, String boxName){
  var box = Hive.box<UserPrinters>(boxName);
  box.clear();
  box.addAll(finance);
  print('ooo');
  debugPrint(box.toString());
}