import 'package:dartz/dartz.dart';
import 'package:printing_costs_2/core/error/failure.dart';
import 'package:printing_costs_2/features/login/data/models/login_model.dart';

abstract class LoginRepo{
  Future<Either<ServerFailure,Login>> fetchLoginData(Map<String, dynamic> data2);
  Future<Either<ServerFailure,Login>> fetchLogin();
  Future<Either<ServerFailure,Login>> logoutUser(dynamic id);
  Future<Either<ServerFailure,Login>> changeImage(dynamic id,Map<String, dynamic> data1) ;
}