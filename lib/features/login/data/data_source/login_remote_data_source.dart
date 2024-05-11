import 'package:flutter/material.dart';
import 'package:printing_costs_2/constants.dart';
import 'package:printing_costs_2/core/utils/api_service.dart';
import 'package:printing_costs_2/core/utils/functions/save_login.dart';
import 'package:printing_costs_2/features/login/data/models/login_model.dart';

abstract class LoginRemoteDataSource{
  Future<Login> fetchLogin();
  Future<Login> fetchLoginData(Map<String, dynamic> data2);
  Future logoutUser(dynamic id) ;
  Future<Login> changeImage(dynamic id,Map<String, dynamic> data1) ;
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource{
  final ApiService apiService;
  LoginRemoteDataSourceImpl(this.apiService);

  @override
  Future<Login> fetchLoginData(Map<String, dynamic> data2) async{
    debugPrint("okokokoko");
    var data = await apiService.post(data1: data2, endPoint: 'auth/login/');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    Login nums = getLogin(data);
    saveLoginData(nums, kLoginBox);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }

  @override
  Future<Login> changeImage(dynamic id,Map<String,dynamic> data1) async{
    var data = await apiService.post(data1: data1, endPoint: 'auth/photo/$id');
    Login nums = getLogin(data);
    saveLoginData(nums, kLoginBox);
    return nums;
  }

  @override
  Future logoutUser(dynamic id) async{
    deleteLoginData(kLoginBox);
  }

  Login getLogin(Map<String,dynamic> data){
    debugPrint("123456789");
    Login nums = Login.fromJson(data['data']);
    debugPrint("HRHRRTTTTTTTT");
    debugPrint(nums.toString());
    return nums;
  }

  @override
  Future<Login> fetchLogin() {
    // TODO: implement fetchLogin
    throw UnimplementedError();
  }

}