
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:printing_costs_2/core/error/failure.dart';
import 'package:printing_costs_2/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:printing_costs_2/features/home/data/models/home.dart';
import 'package:printing_costs_2/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource});
  @override
  Future<Either<ServerFailure, Home>> fetchHome(Map<String, dynamic> data2) async {
    try {
      Home nums;
      nums=await homeRemoteDataSource.fetchHome(data2);
      if(nums != null){
        return right(nums);
      }
      return left(ServerFailure(nums.toString()));
    }   catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}