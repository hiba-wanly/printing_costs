import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:printing_costs_2/core/error/failure.dart';
import 'package:printing_costs_2/features/finance/data/data_sources/finance_local_data_source.dart';
import 'package:printing_costs_2/features/finance/data/data_sources/finance_remote_data_source.dart';
import 'package:printing_costs_2/features/finance/data/models/finance_model.dart';
import 'package:printing_costs_2/features/finance/domain/repos/finance_repo.dart';

class FinanceRepoImpl extends FinanceRepo {
  final FinanceRemoteDataSource financeRemoteDataSource;
  final FinanceLocalDataSource financeLocalDataSource;

  FinanceRepoImpl({required this.financeRemoteDataSource,required this.financeLocalDataSource});
  @override
  Future<Either<ServerFailure, Finance>> fetchFinanceNum(int id)async {
   try {
     print("KKKKKKKKK11");
     Finance nums;

     // nums = financeLocalDataSource.fetchFinanceNum();
     // if(nums != null){
     //
     //   return right(nums);
     // }
     print("KKKKKKKKK22");
     nums= await financeRemoteDataSource.fetchFinanceNum(id);
     return right(nums);
   }   catch (e) {
     if(e is DioError){
       return left(ServerFailure.fromDioError(e));
     }
     return left(ServerFailure(e.toString()));
   }
  }

  @override
  Future<Either<ServerFailure,Finance>> updateFinanceNum(int num, int id,int userid) async{
    try {
      print("KKKKKKKKK");
      Finance nums;
      // nums=financeLocalDataSource.fetchFinanceNum();
      // if(nums.isNotEmpty){
      //   return right(nums);
      // }
     Map<String,dynamic> data2 = {
        'coins' : num
      };
      nums= await financeRemoteDataSource.updateFinanceNum(id , data2, userid);
      return right(nums);
    }   catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}