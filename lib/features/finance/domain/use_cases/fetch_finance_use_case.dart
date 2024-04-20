import 'package:dartz/dartz.dart';
import 'package:printing_costs_2/core/error/failure.dart';
import 'package:printing_costs_2/features/finance/data/models/finance_model.dart';
import 'package:printing_costs_2/features/finance/domain/repos/finance_repo.dart';
import 'package:printing_costs_2/features/finance/domain/use_cases/use_case.dart';

class FetchFinanceUseCase extends UseCase<Finance,NoParam> {
  final FinanceRepo financeRepo;
  FetchFinanceUseCase(this.financeRepo);

  @override
  Future<Either<Failure, Finance>> call(int userid,[NoParam? param]) async{
    return await financeRepo.fetchFinanceNum(userid);
  }

  @override
  Future<Either<Failure, Finance>> call2(int num,int id,int userid,[NoParam? param]) async{
    return await financeRepo.updateFinanceNum(num, id,userid);
  }
}