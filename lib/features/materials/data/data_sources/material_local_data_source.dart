import 'package:hive/hive.dart';
import 'package:printing_costs_2/constants.dart';
import 'package:printing_costs_2/features/materials/data/models/material_model.dart';
import 'package:printing_costs_2/features/materials/data/models/user_material_model.dart';
abstract class MaterialLocalDataSource {
  List<Materials> fetchMaterialList();
  List<UserMaterials> fetchUserMaterial();
}

class MaterialLocalDataSourceImpl extends MaterialLocalDataSource
{


  @override
  List<Materials> fetchMaterialList() {
    var box = Hive.box<Materials>(kMaterialBox);
    // box.clear();
    return box.values.toList();
  }

  @override
  List<UserMaterials> fetchUserMaterial() {
    var box = Hive.box<UserMaterials>(kUserMaterialBox);
    // box.clear();
    return box.values.toList();
  }

}