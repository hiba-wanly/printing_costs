import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:printing_costs_2/features/other/data/models/other_model.dart';

void saveOtherData(Other other, String boxName){
  var box = Hive.box<Other>(boxName);
  box.add(other);
}

void updateOtherData(Other finance, String boxName){
  var box = Hive.box<Other>(boxName);
  box.clear();
  box.add(finance);
  debugPrint(box.toString());
}