import 'package:printing_costs_2/constants.dart';
import 'package:printing_costs_2/core/utils/api_service.dart';
import 'package:printing_costs_2/core/utils/functions/save_other.dart';
import 'package:printing_costs_2/features/other/data/models/other_model.dart';

abstract class OtherRemoteDataSource{
  Future<Other> fetchOtherNum(int userid);
  Future<Other> updateOtherNum(dynamic id,Map<String ,dynamic> data1, int userid) ;
}

class OtherRemoteDataSourceImpl extends OtherRemoteDataSource{
  final ApiService apiService;
 OtherRemoteDataSourceImpl(this.apiService);

  @override
  Future<Other> fetchOtherNum(int userid) async{
    var data = await apiService.get(endPoint: 'other/getuserother/$userid');
    Other nums = getOtherNum(data);
    saveOtherData(nums, kOtherBox);
    return nums;
  }

  @override
  Future<Other> updateOtherNum(dynamic id,Map<String ,dynamic> data1, int userid) async{
    var data = await apiService.update(endPoint: 'other/addORupdate/$userid',data: data1);
    Other nums = getOtherNum(data);
    updateOtherData(nums, kOtherBox);
    return nums;
  }

  Other getOtherNum(Map<String,dynamic> data){
    Other nums=Other.fromJson(data['data']);
    return nums;
  }



}