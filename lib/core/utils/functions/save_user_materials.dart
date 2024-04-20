

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:printing_costs_2/features/materials/data/models/user_material_model.dart';

void saveUserMaterialsData(List<UserMaterials> material, String boxName){
  var box = Hive.box<UserMaterials>(boxName);
  box.addAll(material);
}
void updateUserMaterialData(List<UserMaterials> finance, String boxName){
  var box = Hive.box<UserMaterials>(boxName);
  box.clear();
  box.addAll(finance);
  debugPrint(box.toString());
}