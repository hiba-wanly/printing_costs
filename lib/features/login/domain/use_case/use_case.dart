import 'package:dartz/dartz.dart';
import 'package:printing_costs_2/core/error/failure.dart';

abstract class UseCase<Type , Param>{
  Future<Either<Failure,Type>> call([Param param]);
  Future<Either<Failure,Type>> callLogin(Map<String,dynamic> data2,[Param param]);
  Future<Either<Failure,Type>> callImage(Map<String,dynamic> data2,int id,[Param param]);
  Future<Either<Failure,Type>> callLogout(int id,[Param param]);
}
class NoParam{}