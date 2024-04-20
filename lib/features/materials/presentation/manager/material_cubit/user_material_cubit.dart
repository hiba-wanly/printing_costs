import 'package:bloc/bloc.dart';
import 'package:printing_costs_2/features/materials/domain/use_cases/fetch_material_use_case.dart';
import 'package:printing_costs_2/features/materials/presentation/manager/material_cubit/user_material_state.dart';

class MaterialsUserCubit extends Cubit<MaterialUserListState>{
  MaterialsUserCubit(this.fetchMaterialUseCase, this.fetchUserMaterialUseCase) : super(MaterialUserListInitial());

  final FetchMaterialUseCase fetchMaterialUseCase;
  final FetchUserMaterialUseCase fetchUserMaterialUseCase;


  Future<void> fetchUserMaterialsList(int id) async{
    emit(MaterialUserListLoading());

    var result = await  fetchUserMaterialUseCase.callUser(id);

    result.fold((failure) {

      emit(MaterialUserListFailure(failure.message));
    }, (material) {

      print("blocusermaterial");
      emit(MaterialUserListSuccessS(material));
    });


  }
  //
  // Future<void> updateMaterialList(UserMaterials materials, int id) async{
  //   emit(MaterialListLoading());
  //   Map<String,dynamic> data2 = materials.toJson();
  //   var result = await  fetchUserMaterialUseCase.callUpdate(data2, id);
  //
  //   result.fold((failure) {
  //
  //     emit(MaterialListFailure(failure.message));
  //   }, (material) {
  //     emit(MaterialUserListSuccess(material));
  //   });
  // }
  //
  // Future<void> deleteMaterialList( int id) async{
  //   emit(MaterialListLoading());
  //   var result = await  fetchUserMaterialUseCase.callDelete( id);
  //
  //   result.fold((failure) {
  //
  //     emit(MaterialListFailure(failure.message));
  //   }, (material) {
  //     emit(MaterialUserListSuccess(material));
  //   });
  // }
  //
  // Future<void> addMaterialList(Materials materials,int id, int userid) async{
  //   emit(MaterialListLoading());
  //   Map<String,dynamic> data2 = materials.toJson();
  //   debugPrint("addMateriallllllll");
  //   debugPrint(data2.toString());
  //   var result = await  fetchUserMaterialUseCase.callAdd(data2,id,userid);
  //
  //   result.fold((failure) {
  //
  //     emit(MaterialListFailure(failure.message));
  //   }, (material) {
  //     emit(MaterialUserListSuccess(material));
  //   });
  // }

}