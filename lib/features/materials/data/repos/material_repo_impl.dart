import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:printing_costs_2/core/error/failure.dart';
import 'package:printing_costs_2/features/materials/data/data_sources/material_local_data_source.dart';
import 'package:printing_costs_2/features/materials/data/data_sources/material_remote_data_source.dart';
import 'package:printing_costs_2/features/materials/data/models/material_model.dart';
import 'package:printing_costs_2/features/materials/data/models/user_material_model.dart';
import 'package:printing_costs_2/features/materials/domain/repos/material_repo.dart';

class MaterialRepoImpl extends MaterialRepo {
  final MaterialRemoteDataSource materialRemoteDataSource;
  final MaterialLocalDataSource materialLocalDataSource;

  MaterialRepoImpl({required this.materialRemoteDataSource,required this.materialLocalDataSource});
  @override
  Future<Either<ServerFailure, List<Materials>>> fetchMaterialList()async {
    try {
      List<Materials> nums;
      // nums= materialLocalDataSource.fetchMaterialList();
      // if(nums.isNotEmpty){
      //   return right(nums);
      // }
      nums= await materialRemoteDataSource.fetchMaterialList();
      return right(nums);
    }   catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<UserMaterials>>> fetchUserMaterialList(int id)async {
    try {
      List<UserMaterials> nums;
      // nums= materialLocalDataSource.fetchUserMaterial();
      // if(nums.isNotEmpty){
      //   return right(nums);
      // }
      nums= await materialRemoteDataSource.fetchUserMaterialList(id);
      return right(nums);
    }   catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<UserMaterials>>> updateMaterialList(Map<String, dynamic> data2, int id, int ui) async{
    try {
      print("KKKKKKKKK");
      List<UserMaterials> nums;
      nums= await materialRemoteDataSource.updateMaterialList(id, data2 ,ui);
      return right(nums);
    }   catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<UserMaterials>>> addMaterialList(int id,int userid,String owner)async {
    try {
      debugPrint("ADDMATERIALLLLLLL");
      List<UserMaterials> nums;
      nums= await materialRemoteDataSource.addMaterialList(id,userid,owner);
      return right(nums);
    }   catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<UserMaterials>>> deleteMaterialList(int id, int ui)async {
    try {
      print("DELETEEEE");
      List<UserMaterials> nums;
      nums= await materialRemoteDataSource.deleteMaterialList( id ,ui);
      return right(nums);
    }   catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}