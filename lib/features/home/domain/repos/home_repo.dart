import 'package:dartz/dartz.dart';
import 'package:printing_costs_2/core/error/failure.dart';
import 'package:printing_costs_2/features/home/data/models/home.dart';

abstract class HomeRepo{
  Future<Either<ServerFailure, Home>> fetchHome(Map<String,dynamic> data2);
}