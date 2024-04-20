import 'package:dartz/dartz.dart';
import 'package:printing_costs_2/core/error/failure.dart';

abstract class UseCase<Type , Param>{
  Future<Either<Failure,Type>> call(int userid,[Param param]);
  Future<Either<Failure,Type>> call2(int num,int id,int userid,[Param param]);
}
class NoParam{}