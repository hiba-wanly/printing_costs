import 'package:bloc/bloc.dart';
import 'package:printing_costs_2/features/other/data/models/other_model.dart';
import 'package:printing_costs_2/features/other/domain/use_case/fetch_other_use_case.dart';
import 'package:printing_costs_2/features/other/presentation/manager/other_cubit/other_state.dart';

class OtherCubit extends Cubit<OtherListState>{
  OtherCubit(this.fetchOtherUseCase) : super(OtherListInitial());

  final FetchOtherUseCase fetchOtherUseCase;

  Future<void> fetchOtherList(int userid) async{
    emit(OtherListLoading());

    var result = await  fetchOtherUseCase.call(userid);

    result.fold((failure) {

      emit(OtherListFailure(failure.message));
    }, (other) {
      emit(OtherListSuccess(other));
    });


  }
  Future<void> updateOtherList(Other data1, int id, int userid) async{
    emit(OtherListLoading());
    Map<String,dynamic> data2 = data1.toJson();
    var result = await  fetchOtherUseCase.callUpdate(data2, id,userid);

    result.fold((failure) {

      emit(OtherListFailure(failure.message));
    }, (finance) {
      emit(OtherListSuccess(finance));
    });
  }

}