

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing_costs_2/features/home/data/models/home.dart';
import 'package:printing_costs_2/features/home/domain/use_case/fetch_home_use_case.dart';
import 'package:printing_costs_2/features/home/presentation/manager/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit(this.fetchHomeUseCase) : super(HomeInitial());

  final FetchHomeUseCase fetchHomeUseCase;

  Future<void> fetchHome(Home home) async{
    emit(HomeLoading());
    Map<String,dynamic> data2 = home.toJson();
    var result = await  fetchHomeUseCase.call(data2);
    debugPrint(
      "wewewewe"
    );
    debugPrint(result.toString());

    result.fold((failure) {

      emit(HomeFailure(failure.message));
    }, (home) {
      emit(HomeSuccess(home));
    });


  }

}