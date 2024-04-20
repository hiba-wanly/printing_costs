import 'package:flutter/material.dart';
import 'package:printing_costs_2/features/printers/data/model/printer_model.dart';
import 'package:printing_costs_2/features/printers/data/model/user_printer_model.dart';

@immutable
abstract class PrinterUserListState{}

class PrinterUserListInitial extends PrinterUserListState{}



class PrinterUserListLoading extends PrinterUserListState{}

class PrinterUserListFailure extends PrinterUserListState{
  final String errMessage;
  PrinterUserListFailure(this.errMessage);
}


class PrinterUserListSuccessS extends PrinterUserListState{
  final List<UserPrinters> printer;
  PrinterUserListSuccessS(this.printer);
}