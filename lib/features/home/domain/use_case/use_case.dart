import 'package:dartz/dartz.dart';
import 'package:printing_costs_2/core/error/failure.dart';

abstract class UseCase<Type , Param>{
  Future<Either<Failure,Type>> call(Map<String,dynamic> data1,[Param param]);
}
class NoParam{}