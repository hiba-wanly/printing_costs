import 'package:bloc/bloc.dart';
import 'package:printing_costs_2/features/printers/data/model/user_printer_model.dart';
import 'package:printing_costs_2/features/printers/domain/use_cases/fetch_printer_use_case.dart';
import 'package:printing_costs_2/features/printers/presentation/manager/printer_cubit/user_printer_state.dart';

class PrintersUserCubit extends Cubit<PrinterUserListState>{
  PrintersUserCubit(this.fetchPrintersUseCase, this.fetchUserPrintersUseCase) : super(PrinterUserListInitial());

  final FetchPrintersUseCase fetchPrintersUseCase;
  final FetchUserPrintersUseCase fetchUserPrintersUseCase;


  Future<void> fetchUserPrinterList(int userid) async{
    emit(PrinterUserListLoading());

    var result = await  fetchUserPrintersUseCase.callUser(userid);

    result.fold((failure) {

      emit(PrinterUserListFailure(failure.message));
    }, (printer) {
      emit(PrinterUserListSuccessS(printer));
    });


  }

  // Future<void> updatePrinterList(UserPrinters materials, int id) async{
  //   emit(PrinterListLoading());
  //   Map<String,dynamic> data2 = materials.toJson();
  //   var result = await  fetchUserPrintersUseCase.callUpdate(data2, id);
  //
  //   result.fold((failure) {
  //
  //     emit(PrinterListFailure(failure.message));
  //   }, (printer) {
  //     emit(PrinterUserListSuccess(printer));
  //   });
  // }
  //
  // Future<void> deletePrinterList( int id) async{
  //   emit(PrinterListLoading());
  //   var result = await  fetchUserPrintersUseCase.callDelete( id);
  //
  //   result.fold((failure) {
  //
  //     emit(PrinterListFailure(failure.message));
  //   }, (printer) {
  //     emit(PrinterUserListSuccess(printer));
  //   });
  // }
  //
  // Future<void> addPrinterList(int id , int userid) async{
  //   emit(PrinterListLoading());
  //   // Map<String,dynamic> data2 = materials.toJson();
  //   var result = await  fetchUserPrintersUseCase.callAdd(id,userid);
  //
  //   result.fold((failure) {
  //
  //     emit(PrinterListFailure(failure.message));
  //   }, (printer) {
  //     emit(PrinterUserListSuccess(printer));
  //   });
  // }

}