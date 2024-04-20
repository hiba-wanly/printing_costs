import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:printing_costs_2/core/error/failure.dart';
import 'package:printing_costs_2/features/other/data/data_sources/other_local_data_source.dart';
import 'package:printing_costs_2/features/other/data/data_sources/other_remote_data_source.dart';
import 'package:printing_costs_2/features/other/data/models/other_model.dart';
import 'package:printing_costs_2/features/other/domain/repos/other_repo.dart';

class OtherRepoImpl extends OtherRepo{
  final OtherRemoteDataSource otherRemoteDataSource;
  final OtherLocalDataSource otherLocalDataSource;

  OtherRepoImpl({required this.otherRemoteDataSource,required this.otherLocalDataSource});
  @override
  Future<Either<ServerFailure, Other>> fetchOtherNum(int userid)async {
    try {
      Other nums;
      // nums= otherLocalDataSource.fetchOtherNum();
      // if(nums != null){
      //   return right(nums);
      // }
      nums= await otherRemoteDataSource.fetchOtherNum(userid);
      return right(nums);
    }   catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, Other>> updateOtherNum(Map<String , dynamic> data2, int id, int userid) async{
    try {
      print("KKKKKKKKK");
      Other nums;

      nums= await otherRemoteDataSource.updateOtherNum(id , data2, userid);
      return right(nums);
    }   catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}