import 'package:dartz/dartz.dart';
import 'package:printing_costs_2/core/error/failure.dart';

abstract class UseCase<Type , Param>{
  Future<Either<Failure,Type>> call([Param param]);
  Future<Either<Failure,Type>> callUser(int id,[Param param]);
  Future<Either<Failure,Type>> callUpdate(Map<String,dynamic> data2,int id,[Param param]);
  Future<Either<Failure,Type>> callDelete(int id,[Param param]);
  Future<Either<Failure,Type>> callAdd(int id, int userid,[Param param]);
}
class NoParam{}