import 'package:flutter/material.dart';
import 'package:printing_costs_2/constants.dart';
import 'package:printing_costs_2/core/utils/api_service.dart';
import 'package:printing_costs_2/core/utils/functions/save_materilas.dart';
import 'package:printing_costs_2/core/utils/functions/save_user_materials.dart';
import 'package:printing_costs_2/features/materials/data/models/material_model.dart';
import 'package:printing_costs_2/features/materials/data/models/user_material_model.dart';

abstract class MaterialRemoteDataSource{
  Future<List<Materials>> fetchMaterialList();
  Future<List<UserMaterials>> fetchUserMaterialList(int id);
  Future<List<UserMaterials>> updateMaterialList(dynamic id,Map<String,dynamic> data1) ;
  Future<List<UserMaterials>> addMaterialList(int id,int userid) ;
  Future<List<UserMaterials>> deleteMaterialList(dynamic id) ;
}

class MaterialRemoteDataSourceImpl extends MaterialRemoteDataSource{
  final ApiService apiService;
  MaterialRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<Materials>> fetchMaterialList() async{
    var data = await apiService.get(endPoint: 'material/getAll');
    List<Materials> nums = getMaterialList(data);
    saveMaterialsData(nums, kMaterialBox);
    return nums;
  }

  @override
  Future<List<UserMaterials>> fetchUserMaterialList(int id) async{
    var data = await apiService.get(endPoint: 'usermaterial/getAll/${id}');
    List<UserMaterials> nums = getUserMaterialList(data);
    saveUserMaterialsData(nums, kUserMaterialBox);
    return nums;
  }

  @override
  Future<List<UserMaterials>> updateMaterialList(dynamic id,Map<String,dynamic> data1) async{
    var data = await apiService.update(endPoint: 'usermaterial/update/${id}',data: data1);
    List<UserMaterials> nums = getUserMaterialList(data);
    updateUserMaterialData(nums, kUserMaterialBox);
    return nums;
  }

  @override
  Future<List<UserMaterials>> addMaterialList(int id,int userid) async{
    debugPrint("M1");
    var data = await apiService.post(endPoint: 'usermaterial/add/${id}/${userid}',data1: {});
    debugPrint("M2");
    debugPrint(data.toString());
    List<UserMaterials> nums = getUserMaterialList(data);
    updateUserMaterialData(nums, kUserMaterialBox);
    return nums;
  }

  @override
  Future<List<UserMaterials>> deleteMaterialList(dynamic id) async {
    var data = await apiService.delete(endPoint: 'usermaterial/delete/${id}');
    List<UserMaterials> nums = getUserMaterialList(data);
    updateUserMaterialData(nums, kUserMaterialBox);
    return nums;
  }

  List<Materials> getMaterialList(Map<String,dynamic> data){
    List<Materials> nums=[];
    for(var numMap in data['data']){
      nums.add(Materials.fromJson(numMap));
    }
    return nums;
  }

  List<UserMaterials> getUserMaterialList(Map<String,dynamic> data){
    List<UserMaterials> nums=[];
    for(var numMap in data['data']){
      nums.add(UserMaterials.fromJson(numMap));
    }
    return nums;
  }


}