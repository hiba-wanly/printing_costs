import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:printing_costs_2/core/error/failure.dart';
import 'package:printing_costs_2/features/printers/data/data_sources/printer_local_data_source.dart';
import 'package:printing_costs_2/features/printers/data/data_sources/printer_remote_data_source.dart';
import 'package:printing_costs_2/features/printers/data/model/printer_model.dart';
import 'package:printing_costs_2/features/printers/data/model/user_printer_model.dart';
import 'package:printing_costs_2/features/printers/domain/repos/printer_repo.dart';

class PrintersRepoImpl extends PrinterRepo {
  final PrinterRemoteDataSource printersRemoteDataSource;
  final PrintersLocalDataSource printersLocalDataSource;

  PrintersRepoImpl({required this.printersRemoteDataSource,required this.printersLocalDataSource});
  @override
  Future<Either<ServerFailure, List<Printers>>> fetchPrinterList()async {
    try {
      List<Printers> nums;
      // nums= printersLocalDataSource.fetchPrinterList();
      // if(nums.isNotEmpty){
      //   return right(nums);
      // }
      nums= await printersRemoteDataSource.fetchPrinterList();
      return right(nums);
    }   catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<UserPrinters>>> updatePrinterList(Map<String, dynamic> data2, int id) async{
    try {
      print("KKKKKKKKK");
      List<UserPrinters> nums;
      nums= await printersRemoteDataSource.updatePrinterList(id, data2 );
      return right(nums);
    }   catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<UserPrinters>>> addPrinterList(int id,int userid)async {
    try {
      print("KKKKKKKKK");
      List<UserPrinters> nums;
      nums= await printersRemoteDataSource.addPrinterList(id , userid);
      return right(nums);
    }   catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<UserPrinters>>> deletePrinterList(int id)async {
    try {
      print("KKKKKKKKK");
      List<UserPrinters> nums;
      nums= await printersRemoteDataSource.deletePrinterList( id );
      return right(nums);
    }   catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<UserPrinters>>> fetchUserPrinterList(int id) async {
    try {
      List<UserPrinters> nums;
      // nums= printersLocalDataSource.fetchUserPrinterList();
      // if(nums.isNotEmpty){
      //   return right(nums);
      // }
      nums= await printersRemoteDataSource.fetchUserPrinterList(id);
      return right(nums);
    }   catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}