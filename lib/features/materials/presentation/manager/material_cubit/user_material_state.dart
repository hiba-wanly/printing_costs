import 'package:flutter/material.dart';
import 'package:printing_costs_2/features/materials/data/models/user_material_model.dart';

@immutable
abstract class MaterialUserListState{}

class MaterialUserListInitial extends MaterialUserListState{}

class MaterialUserListLoading extends MaterialUserListState{}

class MaterialUserListFailure extends MaterialUserListState{
  final String errMessage;
  MaterialUserListFailure(this.errMessage);
}


class MaterialUserListSuccessS extends MaterialUserListState{
  final List<UserMaterials> material;
  MaterialUserListSuccessS(this.material);
}
