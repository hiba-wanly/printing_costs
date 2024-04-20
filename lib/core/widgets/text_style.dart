import 'package:flutter/material.dart';
import 'package:printing_costs_2/constants.dart';

class TEXT extends StatelessWidget {
  String text;
  double w;
   TEXT({Key? key, required this.text,required this.w}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: Almarai,
          fontSize: w,
          color: Colors.black),
    );
  }
}
