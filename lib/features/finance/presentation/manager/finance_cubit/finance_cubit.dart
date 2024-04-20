import 'package:bloc/bloc.dart';
import 'package:printing_costs_2/features/finance/domain/use_cases/fetch_finance_use_case.dart';
import 'package:printing_costs_2/features/finance/presentation/manager/finance_cubit/finance_state.dart';

class FinanceCubit extends Cubit<FinanceListState>{
  FinanceCubit(this.fetchFinanceUseCase) : super(FinanceListInitial());


 final FetchFinanceUseCase fetchFinanceUseCase;

  Future<void> fetchFinanceList(int userid) async{
    emit(FinanceListLoading());

   var result = await  fetchFinanceUseCase.call(userid);

   result.fold((failure) {

     emit(FinanceListFailure(failure.message));
   }, (finance) {
     emit(FinanceListSuccess(finance));
   });


  }

  Future<void> updateFinanceList(int num, int id,int userid) async{
    emit(FinanceListLoading());
    var result = await  fetchFinanceUseCase.call2(num, id,userid);

    result.fold((failure) {

      emit(FinanceListFailure(failure.message));
    }, (finance) {
      emit(FinanceListSuccess(finance));
    });
  }

}