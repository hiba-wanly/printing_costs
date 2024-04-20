import 'package:dartz/dartz.dart';
import 'package:printing_costs_2/core/error/failure.dart';
import 'package:printing_costs_2/features/other/data/models/other_model.dart';

abstract class OtherRepo{
  Future<Either<ServerFailure,Other>> fetchOtherNum(int userid);
  Future<Either<ServerFailure,Other>> updateOtherNum(Map<String ,dynamic> data2,int id, int userid);
}