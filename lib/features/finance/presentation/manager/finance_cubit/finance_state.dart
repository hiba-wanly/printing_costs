import 'package:flutter/material.dart';
import 'package:printing_costs_2/features/finance/data/models/finance_model.dart';

@immutable
abstract class FinanceListState{}

class FinanceListInitial extends FinanceListState{}

class FinanceListLoading extends FinanceListState{}

class FinanceListFailure extends FinanceListState{
  final String errMessage;
  FinanceListFailure(this.errMessage);
}

class FinanceListSuccess extends FinanceListState{
  final Finance finance;
  FinanceListSuccess(this.finance);
}
