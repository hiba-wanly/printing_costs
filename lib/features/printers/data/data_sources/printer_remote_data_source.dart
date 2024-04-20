import 'package:printing_costs_2/constants.dart';
import 'package:printing_costs_2/core/utils/api_service.dart';
import 'package:printing_costs_2/core/utils/functions/save-user_printers.dart';
import 'package:printing_costs_2/core/utils/functions/save_printers.dart';
import 'package:printing_costs_2/features/materials/data/models/material_model.dart';
import 'package:printing_costs_2/features/other/data/models/other_model.dart';
import 'package:printing_costs_2/features/printers/data/model/printer_model.dart';
import 'package:printing_costs_2/features/printers/data/model/user_printer_model.dart';

abstract class PrinterRemoteDataSource{
  Future<List<Printers>> fetchPrinterList();
  Future<List<UserPrinters>> fetchUserPrinterList(int id);
  Future<List<UserPrinters>> updatePrinterList(dynamic id,Map<String,dynamic> data1) ;
  Future<List<UserPrinters>>  addPrinterList(int id ,int userid) ;
  Future<List<UserPrinters>> deletePrinterList(dynamic id);
}

class PrintersRemoteDataSourceImpl extends PrinterRemoteDataSource{
  final ApiService apiService;
  PrintersRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<Printers>> fetchPrinterList() async{
    var data = await apiService.get(endPoint: 'printer/getAll');
    List<Printers> nums = getPrinterList(data);
    savePrintersData(nums, kPrinterBox);
    return nums;
  }

  @override
  Future<List<UserPrinters>> fetchUserPrinterList(int id) async{
    var data = await apiService.get(endPoint: 'userprinter/getAll/${id}');
    List<UserPrinters> nums = getUserPrinterList(data);
    saveUserPrintersData(nums, kUserPrinterBox);
    return nums;
  }

  @override
  Future<List<UserPrinters>> updatePrinterList(dynamic id,Map<String,dynamic> data1) async{
    var data = await apiService.update(endPoint: 'userprinter/update/${id}',data: data1);
    List<UserPrinters> nums = getUserPrinterList(data);
    updateUserPrintersData(nums, kUserPrinterBox);
    return nums;
  }

  @override
  Future<List<UserPrinters>> addPrinterList(int id,int userid) async{
    print("PPP");
    var data = await apiService.post(endPoint: 'userprinter/add/${id}/${userid}',data1: {});
    List<UserPrinters> nums = getUserPrinterList(data);
    updateUserPrintersData(nums, kUserPrinterBox);
    return nums;
  }

  @override
  Future<List<UserPrinters>> deletePrinterList(dynamic id) async {
    var data = await apiService.delete(endPoint: 'userprinter/delete/${id}');
    List<UserPrinters> nums = getUserPrinterList(data);
    updateUserPrintersData(nums, kUserPrinterBox);
    return nums;
  }

  List<Printers> getPrinterList(Map<String,dynamic> data){
    List<Printers> nums=[];
    for(var numMap in data['data']){
      nums.add(Printers.fromJson(numMap));
    }
    return nums;
  }

  List<UserPrinters> getUserPrinterList(Map<String,dynamic> data){
    List<UserPrinters> nums=[];
    for(var numMap in data['data']){
      nums.add(UserPrinters.fromJson(numMap));
    }
    return nums;
  }





}