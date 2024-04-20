
import 'package:printing_costs_2/constants.dart';
import 'package:printing_costs_2/features/finance/data/models/finance_model.dart';
import 'package:hive/hive.dart';
abstract class FinanceLocalDataSource {
  Finance fetchFinanceNum();
}

class FinanceLocalDataSourceImpl extends FinanceLocalDataSource
{

  @override
  Finance fetchFinanceNum() {

    var box = Hive.box<Finance>(kFinanceBox);
    print("KKKKKKKKK22");
    // box.clear();
    // print(box.values.first.id);
    return box.values.first;
  }

}
