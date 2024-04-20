import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:printing_costs_2/core/utils/api_service.dart';
import 'package:printing_costs_2/features/home/data/models/home.dart';


abstract class HomeRemoteDataSource{
  Future<Home> fetchHome(Map<String,dynamic> data1);
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  final ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<Home> fetchHome(Map<String, dynamic> data2) async{
    var data = await apiService.post(data1: data2, endPoint: 'orders/create');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    Home nums = getHome(data);
    return nums;
  }

  Home getHome(Map<String,dynamic> data){
    debugPrint("123456789");
    Home nums = Home.fromJson(data['data']);
    debugPrint("HRHRRTTTTTTTT");
    debugPrint(nums.toString());
    return nums;
  }



}