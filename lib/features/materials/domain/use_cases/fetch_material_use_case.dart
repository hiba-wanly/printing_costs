import 'package:dartz/dartz.dart';
import 'package:printing_costs_2/core/error/failure.dart';
import 'package:printing_costs_2/features/materials/data/models/user_material_model.dart';
import 'package:printing_costs_2/features/materials/domain/use_cases/use_case.dart';
import 'package:printing_costs_2/features/materials/data/models/material_model.dart';
import 'package:printing_costs_2/features/materials/domain/repos/material_repo.dart';

class FetchMaterialUseCase extends UseCase<List<Materials>,NoParam> {
  final MaterialRepo materialRepo;

  FetchMaterialUseCase(this.materialRepo);

  @override
  Future<Either<Failure, List<Materials>>> call([NoParam? param]) async {
    return await materialRepo.fetchMaterialList();
  }

  @override
  Future<Either<Failure, List<Materials>>> callAdd( int id, int userid, [NoParam? param]) {
    // TODO: implement callAdd
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Materials>>> callDelete(int id, [NoParam? param]) {
    // TODO: implement callDelete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Materials>>> callUpdate(Map<String, dynamic> data2, int id, [NoParam? param]) {
    // TODO: implement callUpdate
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Materials>>> callUser(int id, [NoParam? param]) {
    // TODO: implement callUser
    throw UnimplementedError();
  }

}

class FetchUserMaterialUseCase extends UseCase<List<UserMaterials>,NoParam> {
  final MaterialRepo materialRepo;

  FetchUserMaterialUseCase(this.materialRepo);


  @override
  Future<Either<Failure, List<UserMaterials>>> callUser(int id,[NoParam? param]) async{
    return await materialRepo.fetchUserMaterialList(id);
  }

  @override
  Future<Either<Failure, List<UserMaterials>>> callUpdate(Map<String,dynamic> data2,int id,[NoParam? param]) async{
    return await materialRepo.updateMaterialList(data2, id);
  }
  @override
  Future<Either<Failure, List<UserMaterials>>> callDelete(int id,[NoParam? param]) async{
    return await materialRepo.deleteMaterialList( id);
  }
  @override
  Future<Either<Failure, List<UserMaterials>>> callAdd(int id, int userid,[NoParam? param]) async{
    return await materialRepo.addMaterialList(id,userid);
  }

  @override
  Future<Either<Failure, List<UserMaterials>>> call([NoParam? param]) {
    // TODO: implement call
    throw UnimplementedError();
  }



}