import 'package:dartz/dartz.dart';
import 'package:printing_costs_2/core/error/failure.dart';
import 'package:printing_costs_2/features/login/data/models/login_model.dart';
import 'package:printing_costs_2/features/login/domain/repos/login_repo.dart';

import '../../../login/domain/use_case/use_case.dart';

class FetchLoginUseCase extends UseCase<Login,NoParam> {
  final LoginRepo loginRepo;
  FetchLoginUseCase(this.loginRepo);

  @override
  Future<Either<Failure, Login>> call([NoParam? param]) async{
    return await loginRepo.fetchLogin();
  }

  @override
  Future<Either<Failure, Login>> callImage(Map<String, dynamic> data2, int id, [NoParam? param]) async{
    return await loginRepo.changeImage(id,data2);
  }

  @override
  Future<Either<Failure, Login>> callLogout(int id, [NoParam? param]) async{
    return await loginRepo.logoutUser(id);
  }

  @override
  Future<Either<Failure, Login>> callLogin(Map<String, dynamic> data2, [NoParam? param]) async{
    return await loginRepo.fetchLoginData(data2);
  }



}