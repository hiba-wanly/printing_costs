import 'package:dartz/dartz.dart';
import 'package:printing_costs_2/core/error/failure.dart';
import 'package:printing_costs_2/features/home/data/models/home.dart';
import 'package:printing_costs_2/features/home/domain/repos/home_repo.dart';

import '../../../home/domain/use_case/use_case.dart';


class FetchHomeUseCase extends UseCase<Home,NoParam> {
  final HomeRepo homeRepo;
  FetchHomeUseCase(this.homeRepo);

  @override
  Future<Either<Failure, Home>> call(Map<String,dynamic> data2,[NoParam? param]) async{
    return await homeRepo.fetchHome(data2);
  }

}