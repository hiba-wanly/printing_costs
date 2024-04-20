import 'package:dartz/dartz.dart';
import 'package:printing_costs_2/core/error/failure.dart';
import 'package:printing_costs_2/features/finance/data/models/finance_model.dart';

abstract class FinanceRepo{
  Future<Either<ServerFailure,Finance>> fetchFinanceNum(int userid);
  Future<Either<ServerFailure,Finance>> updateFinanceNum(int num,int id,int userid);
}