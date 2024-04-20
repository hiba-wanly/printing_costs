import 'package:flutter/material.dart';
import 'package:printing_costs_2/features/materials/data/models/material_model.dart';
import 'package:printing_costs_2/features/materials/data/models/user_material_model.dart';

@immutable
abstract class MaterialListState{}

class MaterialListInitial extends MaterialListState{}

class MaterialListLoading extends MaterialListState{}

class MaterialListFailure extends MaterialListState{
  final String errMessage;
  MaterialListFailure(this.errMessage);
}


class MaterialListSuccess extends MaterialListState{
  final List<Materials> material;
  MaterialListSuccess(this.material);
}

class MaterialUserListSuccess extends MaterialListState{
  final List<UserMaterials> material;
  MaterialUserListSuccess(this.material);
}

