import 'package:dartz/dartz.dart';
import 'package:printing_costs_2/core/error/failure.dart';

abstract class UseCase<Type , Param>{
  Future<Either<Failure,Type>> call([Param param]);
  Future<Either<Failure,Type>> callUser(int userid,[Param param]);
  Future<Either<Failure,Type>> callUpdate(Map<String,dynamic> data2,int id,int ui,[Param param]);
  Future<Either<Failure,Type>> callDelete(int id,int ui,[Param param]);
  Future<Either<Failure,Type>> callAdd(int id, int userid,[Param param]);
}
class NoParam{}