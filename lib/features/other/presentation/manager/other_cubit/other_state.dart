import 'package:flutter/material.dart';
import 'package:printing_costs_2/features/other/data/models/other_model.dart';

@immutable
abstract class OtherListState{}

class OtherListInitial extends OtherListState{}

class OtherListLoading extends OtherListState{}

class OtherListFailure extends OtherListState{
  final String errMessage;
  OtherListFailure(this.errMessage);
}

class OtherListSuccess extends OtherListState{
  final Other other;
  OtherListSuccess(this.other);
}
