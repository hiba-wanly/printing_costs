import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:printing_costs_2/features/printers/data/model/printer_model.dart';

void savePrintersData(List<Printers> printers, String boxName){
  var box = Hive.box<Printers>(boxName);
  box.addAll(printers);
}

void updatePrintersData(List<Printers> finance, String boxName){
  var box = Hive.box<Printers>(boxName);
  box.clear();
  box.addAll(finance);
  debugPrint(box.toString());
}