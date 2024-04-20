import 'package:hive/hive.dart';
import 'package:printing_costs_2/constants.dart';
import 'package:printing_costs_2/features/printers/data/model/printer_model.dart';
import 'package:printing_costs_2/features/printers/data/model/user_printer_model.dart';
abstract class PrintersLocalDataSource {
  List<Printers> fetchPrinterList();
  List<UserPrinters> fetchUserPrinterList();
}

class PrintersLocalDataSourceImpl extends PrintersLocalDataSource
{


  @override
  List<Printers> fetchPrinterList() {
    var box = Hive.box<Printers>(kPrinterBox);
    // box.clear();
    return box.values.toList();
  }

  @override
  List<UserPrinters> fetchUserPrinterList() {
    var box = Hive.box<UserPrinters>(kUserPrinterBox);
    // box.clear();
    return box.values.toList();
  }

}