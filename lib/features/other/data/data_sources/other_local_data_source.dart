import 'package:hive/hive.dart';
import 'package:printing_costs_2/constants.dart';
import 'package:printing_costs_2/features/other/data/models/other_model.dart';
abstract class OtherLocalDataSource {
  Other fetchOtherNum();
}

class OtherLocalDataSourceImpl extends OtherLocalDataSource
{


  @override
  Other fetchOtherNum() {
    var box = Hive.box<Other>(kOtherBox);
    // box.clear();
    return box.values.first;
  }

}