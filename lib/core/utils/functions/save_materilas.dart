import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:printing_costs_2/features/materials/data/models/material_model.dart';

void saveMaterialsData(List<Materials> material, String boxName){
  var box = Hive.box<Materials>(boxName);
  box.addAll(material);
}
void updateMaterialData(List<Materials> finance, String boxName){
  var box = Hive.box<Materials>(boxName);
  box.clear();
  box.addAll(finance);
  debugPrint(box.toString());
}