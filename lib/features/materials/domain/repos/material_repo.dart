import 'package:dartz/dartz.dart';
import 'package:printing_costs_2/core/error/failure.dart';
import 'package:printing_costs_2/features/materials/data/models/material_model.dart';
import 'package:printing_costs_2/features/materials/data/models/user_material_model.dart';

abstract class MaterialRepo{
  Future<Either<ServerFailure,List<Materials>>> fetchMaterialList();
  Future<Either<ServerFailure,List<UserMaterials>>> fetchUserMaterialList(int id);
  Future<Either<ServerFailure,List<UserMaterials>>> updateMaterialList(Map<String,dynamic> data2,int id, int ui);
  Future<Either<ServerFailure,List<UserMaterials>>> deleteMaterialList(int id, int ui);
  Future<Either<ServerFailure,List<UserMaterials>>> addMaterialList(int id,int userid);
}