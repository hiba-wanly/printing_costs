import 'package:printing_costs_2/constants.dart';
import 'package:printing_costs_2/core/utils/api_service.dart';
import 'package:printing_costs_2/core/utils/functions/save_finance.dart';
import 'package:printing_costs_2/features/finance/data/models/finance_model.dart';

abstract class FinanceRemoteDataSource{
  Future<Finance> fetchFinanceNum(int id);
  Future<Finance> updateFinanceNum(int id,Map<String,dynamic> data1,int userId);
}

class FinanceRemoteDataSourceImpl extends FinanceRemoteDataSource{
  final ApiService apiService;
  FinanceRemoteDataSourceImpl(this.apiService);

  @override
  Future<Finance> fetchFinanceNum(int id) async{
    print("SSSSSS");
    var data = await apiService.get(endPoint: 'finance/getuserfinance/${id}');
    Finance nums = getNumsList(data);
    saveFinanceData(nums, kFinanceBox);
    return nums;
  }

  @override
  Future<Finance> updateFinanceNum(int id,Map<String,dynamic> data1, int userId) async{
    var data = await apiService.post(endPoint: 'finance/addORupdate/${userId}', data1: data1);
    Finance nums = getNumsList(data);
    updateFinanceData(nums, kFinanceBox);
    return nums;
  }


  Finance getNumsList(Map<String,dynamic> data){
    Finance nums = Finance.fromJson(data['data']);
    return nums;
  }

}