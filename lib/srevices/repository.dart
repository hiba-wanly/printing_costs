import 'package:printing_costs_2/features/finance/data/models/finance_model.dart';
import 'package:printing_costs_2/features/login/data/models/login_model.dart';
import 'package:printing_costs_2/features/materials/data/models/material_model.dart';
import 'package:printing_costs_2/features/materials/data/models/user_material_model.dart';
import 'package:printing_costs_2/features/other/data/models/other_model.dart';
import 'package:printing_costs_2/features/printers/data/model/printer_model.dart';
import 'package:printing_costs_2/features/printers/data/model/user_printer_model.dart';

class Repository{
  List<Materials>? materials;
  List<UserMaterials>? usermaterials;
  List<Printers>? printers;
  List<UserPrinters>? userprinters;
  Finance? finance;
  Other? other;
  Login? login;
  bool? check1 = false;
  bool? check2 = false;




}