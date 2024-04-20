import 'package:flutter/material.dart';
import 'package:printing_costs_2/features/printers/data/model/printer_model.dart';
import 'package:printing_costs_2/features/printers/data/model/user_printer_model.dart';

@immutable
abstract class PrinterListState{}

class PrinterListInitial extends PrinterListState{}

class PrinterListLoading extends PrinterListState{}

class PrinterListFailure extends PrinterListState{
  final String errMessage;
  PrinterListFailure(this.errMessage);
}

// class PrinterUserListLoading extends PrinterListState{}

// class PrinterUserListFailure extends PrinterListState{
//   final String errMessage;
//   PrinterUserListFailure(this.errMessage);
// }

class PrinterListSuccess extends PrinterListState{
  final List<Printers> printer;
  PrinterListSuccess(this.printer);
}

class PrinterUserListSuccess extends PrinterListState{
  final List<UserPrinters> printer;
  PrinterUserListSuccess(this.printer);
}