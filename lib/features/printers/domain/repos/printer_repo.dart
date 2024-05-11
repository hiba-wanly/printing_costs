import 'package:dartz/dartz.dart';
import 'package:printing_costs_2/core/error/failure.dart';
import 'package:printing_costs_2/features/printers/data/model/printer_model.dart';
import 'package:printing_costs_2/features/printers/data/model/user_printer_model.dart';

abstract class PrinterRepo{
  Future<Either<ServerFailure,List<Printers>>> fetchPrinterList();
  Future<Either<ServerFailure,List<UserPrinters>>> fetchUserPrinterList(int id);
  Future<Either<ServerFailure,List<UserPrinters>>> updatePrinterList(Map<String,dynamic> data2,int id,int ui);
  Future<Either<ServerFailure,List<UserPrinters>>> deletePrinterList(int id,int ui);
  Future<Either<ServerFailure,List<UserPrinters>>> addPrinterList(int id,int userid);
}