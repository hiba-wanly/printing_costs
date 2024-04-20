import 'package:flutter/material.dart';
import 'package:printing_costs_2/features/home/data/models/home.dart';
import 'package:printing_costs_2/features/login/data/models/login_model.dart';

@immutable
abstract class HomeState{}

class HomeInitial extends HomeState{}

class HomeLoading extends HomeState{}

class HomeFailure extends HomeState{
  final String errMessage;
  HomeFailure(this.errMessage);
}

class HomeSuccess extends HomeState{
  final Home errMessage;
  HomeSuccess(this.errMessage);
}