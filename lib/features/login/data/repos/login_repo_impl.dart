import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:printing_costs_2/core/error/failure.dart';
import 'package:printing_costs_2/features/login/data/data_source/login_local_data_source.dart';
import 'package:printing_costs_2/features/login/data/data_source/login_remote_data_source.dart';
import 'package:printing_costs_2/features/login/data/models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:printing_costs_2/features/login/domain/repos/login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  final LoginRemoteDataSource loginRemoteDataSource;
  final LoginLocalDataSource loginLocalDataSource;

  LoginRepoImpl({required this.loginRemoteDataSource,required this.loginLocalDataSource});
  @override
  Future<Either<ServerFailure, Login>> fetchLogin() async {
    try {
      Login nums;
      nums= loginLocalDataSource.fetchLogin();
      return right(nums);
          return left(ServerFailure(nums.toString()));
    }   catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, Login>> fetchLoginData(Map<String,dynamic> data2)async {
    try {
      debugPrint("KKKHEREERER");
      Login nums;
      nums= await loginRemoteDataSource.fetchLoginData(data2);
      debugPrint("AAAAAAAA");
      debugPrint(nums.toString());
      return right(nums);
    }   catch (e) {
      if(e is DioError){
        debugPrint("ERORRORORO11111111111");
        return left(ServerFailure("cannot login "));
      }
      debugPrint("ERORROROR22222222222");
      debugPrint(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, Login>> changeImage(dynamic id,Map<String, dynamic> data1)  async{
    try {
      print("KKKKKKKKK");
      Login nums;
      nums= await loginRemoteDataSource.changeImage(id, data1 );
      return right(nums);
    }   catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, Login>> logoutUser(dynamic id)async {
    try {
      debugPrint("ADDMATERIALLLLLLL");
      Login nums;
      nums= await loginRemoteDataSource.logoutUser( id );
      return right(nums);
    }   catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }


}