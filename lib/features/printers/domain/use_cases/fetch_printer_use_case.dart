import 'package:dartz/dartz.dart';
import 'package:printing_costs_2/core/error/failure.dart';
import 'package:printing_costs_2/features/printers/data/model/user_printer_model.dart';
import 'package:printing_costs_2/features/printers/domain/use_cases/use_case.dart';
import 'package:printing_costs_2/features/printers/data/model/printer_model.dart';
import 'package:printing_costs_2/features/printers/domain/repos/printer_repo.dart';

class FetchPrintersUseCase extends UseCase<List<Printers>,NoParam> {
  final PrinterRepo printerRepo;

  FetchPrintersUseCase(this.printerRepo);

  @override
  Future<Either<Failure, List<Printers>>> call([NoParam? param]) async {
    return await printerRepo.fetchPrinterList();
  }

  @override
  Future<Either<Failure, List<Printers>>> callAdd( int id, int userid, [NoParam? param]) {
    // TODO: implement callAdd
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Printers>>> callDelete(int id,int ui, [NoParam? param]) {
    // TODO: implement callDelete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Printers>>> callUpdate(Map<String, dynamic> data2, int id,int ui, [NoParam? param]) {
    // TODO: implement callUpdate
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Printers>>> callUser(int userid, [NoParam? param]) {
    // TODO: implement callUser
    throw UnimplementedError();
  }
}

class FetchUserPrintersUseCase extends UseCase<List<UserPrinters>,NoParam> {
  final PrinterRepo printerRepo;

  FetchUserPrintersUseCase(this.printerRepo);

  @override
  Future<Either<Failure, List<UserPrinters>>> callUpdate(Map<String,dynamic> data2,int id,int ui,[NoParam? param]) async{
    return await printerRepo.updatePrinterList(data2, id,ui);
  }
  @override
  Future<Either<Failure, List<UserPrinters>>> callDelete(int id,int ui,[NoParam? param]) async{
    return await printerRepo.deletePrinterList( id,ui);
  }
  @override
  Future<Either<Failure, List<UserPrinters>>> callAdd(int id, int userid,[NoParam? param]) async{
    return await printerRepo.addPrinterList(id , userid);
  }

  @override
  Future<Either<Failure, List<UserPrinters>>> call([NoParam? param]) {
    // TODO: implement call
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<UserPrinters>>> callUser(int userid, [NoParam? param]) async{
    return await printerRepo.fetchUserPrinterList(userid);
  }

}