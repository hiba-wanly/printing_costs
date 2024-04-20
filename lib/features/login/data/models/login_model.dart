
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:printing_costs_2/constants.dart';

part  'login_model.g.dart';

@HiveType(typeId: 4)
class Login{
  @HiveField(0)
  dynamic id;
  @HiveField(1)
  dynamic email;
  @HiveField(2)
  dynamic first_name;
  @HiveField(3)
  dynamic last_name;
  @HiveField(4)
  dynamic  password;
  @HiveField(5)
  String? imagepath;
  @HiveField(6)
  File? image;

  Login({
    this.id,
    required this.email,
    required this.password,
    this.first_name,
    this.last_name,
    this.image
});

  Map<String,dynamic> toJson(){
    return {
      "email":email,
      "password":password,
    };
  }

  Login.fromJson(Map<String ,dynamic> json) {
    debugPrint("11111112222222222222233333");
    id = json['id'];
    debugPrint(id.toString());
    email=json['email'];
    debugPrint(email.toString());
    // password=json['password'];
    first_name=json['full_name'];
    debugPrint(first_name.toString());
    // last_name=json['last_name'];
    if (json['logo'] == null){
      imagepath= baseUrl;
      debugPrint(imagepath.toString());
    }
    else {
      imagepath= baseUrl + json['logo'];
      debugPrint(imagepath.toString());
    }
  }





}