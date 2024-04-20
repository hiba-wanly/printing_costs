import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:printing_costs_2/features/finance/data/models/finance_model.dart';

void saveFinanceData(Finance finance, String boxName){
  var box = Hive.box<Finance>(boxName);
  box.add(finance);
  debugPrint(box.toString());
}

void updateFinanceData(Finance finance, String boxName){
  var box = Hive.box<Finance>(boxName);
  box.clear();
  box.add(finance);
  debugPrint(box.toString());
}