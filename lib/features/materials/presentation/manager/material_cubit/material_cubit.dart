import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:printing_costs_2/features/materials/data/models/material_model.dart';
import 'package:printing_costs_2/features/materials/data/models/user_material_model.dart';
import 'package:printing_costs_2/features/materials/domain/use_cases/fetch_material_use_case.dart';
import 'package:printing_costs_2/features/materials/presentation/manager/material_cubit/material_state.dart';

class MaterialsCubit extends Cubit<MaterialListState>{
  MaterialsCubit(this.fetchMaterialUseCase, this.fetchUserMaterialUseCase) : super(MaterialListInitial());

  final FetchMaterialUseCase fetchMaterialUseCase;
  final FetchUserMaterialUseCase fetchUserMaterialUseCase;

  Future<void> fetchMaterialsList() async{
    emit(MaterialListLoading());

    var result = await  fetchMaterialUseCase.call();

    result.fold((failure) {

      emit(MaterialListFailure(failure.message));
    }, (material) {
      emit(MaterialListSuccess(material));
    });


  }

  // Future<void> fetchUserMaterialsList(int id) async{
  //   emit(MaterialUserListLoading());
  //
  //   var result = await  fetchUserMaterialUseCase.callUser(id);
  //
  //   result.fold((failure) {
  //
  //     emit(MaterialUserListFailure(failure.message));
  //   }, (material) {
  //
  //     print("blocusermaterial");
  //     emit(MaterialUserListSuccess(material));
  //   });
  //
  //
  // }

  Future<void> updateMaterialList(UserMaterials materials, int id) async{
    emit(MaterialListLoading());
    Map<String,dynamic> data2 = materials.toJson();
    var result = await  fetchUserMaterialUseCase.callUpdate(data2, id);

    result.fold((failure) {

      emit(MaterialListFailure(failure.message));
    }, (material) {
      emit(MaterialUserListSuccess(material));
    });
  }

  Future<void> deleteMaterialList( int id) async{
    emit(MaterialListLoading());
    var result = await  fetchUserMaterialUseCase.callDelete( id);

    result.fold((failure) {

      emit(MaterialListFailure(failure.message));
    }, (material) {
      emit(MaterialUserListSuccess(material));
    });
  }

  Future<void> addMaterialList(int id, int userid) async{
    emit(MaterialListLoading());
    // Map<String,dynamic> data2 = materials.toJson();
    debugPrint("addMateriallllllll");
    // debugPrint(data2.toString());
    var result = await  fetchUserMaterialUseCase.callAdd(id,userid);

    result.fold((failure) {

      emit(MaterialListFailure(failure.message));
    }, (material) {
      emit(MaterialUserListSuccess(material));
    });
  }

}