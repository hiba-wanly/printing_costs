

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing_costs_2/features/login/data/models/login_model.dart';
import 'package:printing_costs_2/features/login/domain/use_case/fetch_login_use_case.dart';
import 'package:printing_costs_2/features/login/presentation/manager/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit(this.fetchLoginUseCase) : super(LoginInitial());

  final FetchLoginUseCase fetchLoginUseCase;

  Future<void> fetchLogin() async{
    emit(LoginLoading());

    var result = await  fetchLoginUseCase.call();

    result.fold((failure) {

      emit(LoginFailure(failure.message));
    }, (login) {
      emit(LoginSuccess(login));
    });


  }

  Future<void> fetchLoginData(Map<String, dynamic> data) async{
    emit(LoginLoading());

    var result = await  fetchLoginUseCase.callLogin(data);

    result.fold((failure) {

      emit(LoginFailure(failure.message));
    }, (login) {
      emit(LoginSuccess(login));
    });


  }

  Future<void> changeImage(File log, int id) async{
    emit(LoginLoading());
    Map<String,dynamic> data2 = {
      'logo': await MultipartFile.fromFile(log!.path),
    };
    var result = await  fetchLoginUseCase.callImage(data2, id);

    result.fold((failure) {

      emit(LoginFailure(failure.message));
    }, (login) {
      emit(LoginSuccess(login));
    });
  }

  Future<void> logout( int id) async{
    emit(LoginLoading());
    var result = await  fetchLoginUseCase.callLogout( id);

    result.fold((failure) {

      emit(LoginFailure(failure.message));
    }, (login) {
      emit(LoginSuccess(login));
    });
  }


}