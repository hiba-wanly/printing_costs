import 'package:flutter/material.dart';
import 'package:printing_costs_2/features/finance/data/models/finance_model.dart';
import 'package:printing_costs_2/features/materials/data/models/user_material_model.dart';
import 'package:printing_costs_2/features/other/data/models/other_model.dart';
import 'package:printing_costs_2/features/printers/data/model/user_printer_model.dart';
import 'package:printing_costs_2/srevices/repository.dart';

class TotoalCosts{
  static int? totalCost(UserPrinters? printers, UserMaterials? materials, dynamic hours,
      dynamic unit, bool supervision, bool mumber,Repository repository)

  {
    debugPrint(supervision.toString());
    debugPrint(mumber.toString());
    double costPrinter = double.parse(hours) * printers!.Courier_printingP;
    double costMaterial = double.parse(unit) * materials!.cost_per_One;
    double costsupervision = 0;
    Finance? financeF = repository.finance!;
    Other? otherO = repository.other!;
    // debugPrint(otherO!.cost_gain.toString());
    // debugPrint(otherO!.cost_risk.toString());
    if (supervision) {
      costsupervision = printers.Supervision_costs;
    }
    double costmumber = 0;
    if (mumber == false) {
      costmumber = otherO.cost_gain / 100 ;
      debugPrint(costmumber.toString());
    }
    double costRisk = otherO.cost_risk / 100;
    debugPrint(costRisk.toString());
    // if(otherO != null){
    //   cost_risk = otherO!.cost_risk;
    // }
    print("__________");
    // debugPrint(costmumber.toString());
    // debugPrint(cost_risk.toString());
    double total1 =
        printers.preparation_cost +
            printers.start_up_cost +
            costPrinter +
            costMaterial +
            printers.Termination_costs +
            costsupervision
    // +
    // costmumber
        ;
    debugPrint("تكلفة إجمالية");
    debugPrint(total1.toString());


    double total = total1 * ( 1+costmumber + costRisk); ///cost_risk * costmumber;///update it to tottal1 * (1+ cost_risk + costmumber) old = total1 * cost_risk * (1+costmumber)
    debugPrint("تكلفة نهائية");
    debugPrint(total.toString());


    double totalCost = total * financeF.num;

    int cost = totalCost.round();
    debugPrint("تكلفة الطباعة");
    debugPrint(cost.toString());
    int cost00 = (cost / 1000.0).ceil() * 1000;
    print(cost00);


    return cost00;
  }
}