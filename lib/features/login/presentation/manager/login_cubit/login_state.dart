import 'package:flutter/material.dart';
import 'package:printing_costs_2/features/login/data/models/login_model.dart';

@immutable
abstract class LoginState{}

class LoginInitial extends LoginState{}

class LoginLoading extends LoginState{}

class LoginFailure extends LoginState{
  final String errMessage;
  LoginFailure(this.errMessage);
}

class LoginSuccess extends LoginState{
  final Login login;
  LoginSuccess(this.login);
}