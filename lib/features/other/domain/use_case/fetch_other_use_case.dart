import 'package:dartz/dartz.dart';
import 'package:printing_costs_2/core/error/failure.dart';
import 'package:printing_costs_2/features/other/domain/use_case/use_case.dart';
import 'package:printing_costs_2/features/other/data/models/other_model.dart';
import 'package:printing_costs_2/features/other/domain/repos/other_repo.dart';

class FetchOtherUseCase extends UseCase<Other,NoParam> {
  final OtherRepo otherRepo;
  FetchOtherUseCase(this.otherRepo);

  @override
  Future<Either<Failure, Other>> call(int userid,[NoParam? param]) async{
    return await otherRepo.fetchOtherNum(userid);
  }

  @override
  Future<Either<Failure, Other>> callUpdate(Map<String,dynamic> data2,int id,int userid,[NoParam? param]) async{
    return await otherRepo.updateOtherNum(data2, id,userid);
  }

}