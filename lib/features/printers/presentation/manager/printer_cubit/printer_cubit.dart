import 'package:bloc/bloc.dart';
import 'package:printing_costs_2/features/printers/data/model/printer_model.dart';
import 'package:printing_costs_2/features/printers/data/model/user_printer_model.dart';
import 'package:printing_costs_2/features/printers/domain/use_cases/fetch_printer_use_case.dart';
import 'package:printing_costs_2/features/printers/presentation/manager/printer_cubit/printer_state.dart';

class PrintersCubit extends Cubit<PrinterListState>{
  PrintersCubit(this.fetchPrintersUseCase, this.fetchUserPrintersUseCase) : super(PrinterListInitial());

  final FetchPrintersUseCase fetchPrintersUseCase;
  final FetchUserPrintersUseCase fetchUserPrintersUseCase;

  Future<void> fetchPrinterList() async{
    emit(PrinterListLoading());

    var result = await  fetchPrintersUseCase.call();

    result.fold((failure) {

      emit(PrinterListFailure(failure.message));
    }, (printer) {
      emit(PrinterListSuccess(printer));
    });


  }

  // Future<void> fetchUserPrinterList(int userid) async{
  //   emit(PrinterUserListLoading());
  //
  //   var result = await  fetchUserPrintersUseCase.callUser(userid);
  //
  //   result.fold((failure) {
  //
  //     emit(PrinterUserListFailure(failure.message));
  //   }, (printer) {
  //     emit(PrinterUserListSuccess(printer));
  //   });
  //
  //
  // }

  Future<void> updatePrinterList(UserPrinters materials, int id) async{
    emit(PrinterListLoading());
    Map<String,dynamic> data2 = materials.toJson();
    var result = await  fetchUserPrintersUseCase.callUpdate(data2, id);

    result.fold((failure) {

      emit(PrinterListFailure(failure.message));
    }, (printer) {
      emit(PrinterUserListSuccess(printer));
    });
  }

  Future<void> deletePrinterList( int id) async{
    emit(PrinterListLoading());
    var result = await  fetchUserPrintersUseCase.callDelete( id);

    result.fold((failure) {

      emit(PrinterListFailure(failure.message));
    }, (printer) {
      emit(PrinterUserListSuccess(printer));
    });
  }

  Future<void> addPrinterList(int id , int userid) async{
    emit(PrinterListLoading());
    // Map<String,dynamic> data2 = materials.toJson();
    var result = await  fetchUserPrintersUseCase.callAdd(id,userid);

    result.fold((failure) {

      emit(PrinterListFailure(failure.message));
    }, (printer) {
      emit(PrinterUserListSuccess(printer));
    });
  }

}