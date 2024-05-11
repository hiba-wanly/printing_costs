import 'package:flutter/material.dart';
import 'package:printing_costs_2/core/widgets/text_style.dart';
class ONPreesd extends StatelessWidget {
  double h;
  double w ;
  String string;
   ONPreesd({Key? key, required this.h,required this.w,required this.string}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: h * 0.06,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: const LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.deepPurple],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0.2, 0.8],
            tileMode: TileMode.repeated,
          )),

      child: Align(
          alignment: Alignment.center,
          child: TEXT(w : w * 0.035, text: string,)),
    );
  }
}
