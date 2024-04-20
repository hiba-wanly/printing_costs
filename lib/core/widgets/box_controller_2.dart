import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:printing_costs_2/constants.dart';

class BoxController2 extends StatelessWidget {
  TextEditingController controller;
      String? label;
  TextInputType textInputType;
      double h;
  double w;
   BoxController2({Key? key, required this.controller,this.label,required this.textInputType,required this.h
   , required this.w}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      emboss: true,
      color: Colors.white,
      borderRadius: 10,
      depth: -40,
      // margin: EdgeInsets.only(bottom: h*.02),
      width: double.infinity,
      child: TextFormField(
        cursorColor: Colors.black38,
        autofocus: false,
        textDirection: TextDirection.ltr,
        controller: controller,
        style: TextStyle(
            color: Colors.black,
            fontSize: w * 0.04,
            fontWeight: FontWeight.w400,
            fontFamily: Almarai),
        keyboardType: textInputType,
        onFieldSubmitted: (val) {
          print(val);
        },
        validator: (value) {
          if (value!.isEmpty) {
            return '';
          }
        },
        // maxLines: 1,
        decoration: InputDecoration(

          enabledBorder: InputBorder.none,
          // border: OutlineInputBorder(
          //   borderSide: BorderSide(
          //     color: Colors.greenAccent,
          //     width: 3,
          //   ),
          //
          // ),
          hintText: label,
          contentPadding: EdgeInsets.only(left: w*0.05,right: w*0.05),
          hintStyle: TextStyle(
              color: Colors.grey[900],
              fontFamily: Almarai
          ),
          focusedBorder: InputBorder.none,
          // focusedBorder: UnderlineInputBorder(
          //   borderSide: BorderSide(color: Colors.green), // this line changes color
          // ),

        ),
      ),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(5),
      //   color: Colors.white,
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.grey.withOpacity(0.5),
      //       spreadRadius: 2,
      //       blurRadius: 3,
      //       offset: Offset(0, 2), // changes position of shadow
      //     ),
      //   ],
      // ),

      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   children: [
      //     Container(
      //
      //       child: TextFormField(
      //         cursorColor: Colors.green,
      //         autofocus: false,
      //         textDirection: TextDirection.ltr,
      //         controller: controller,
      //         style: TextStyle(
      //             color: Colors.black,
      //             fontSize: w * 0.04,
      //             fontWeight: FontWeight.w400,
      //             fontFamily: Almarai),
      //         keyboardType: textInputType,
      //         onFieldSubmitted: (val) {
      //           print(val);
      //         },
      //         validator: (value) {
      //           if (value!.isEmpty) {
      //             return '';
      //           }
      //         },
      //         // maxLines: 1,
      //         decoration: InputDecoration(
      //           // border: OutlineInputBorder(
      //           //   borderSide: BorderSide(
      //           //     color: Colors.greenAccent,
      //           //     width: 3,
      //           //   ),
      //           //
      //           // ),
      //           hintText: label,
      //           contentPadding: EdgeInsets.only(left: w*0.05,right: w*0.05),
      //           hintStyle: TextStyle(
      //               color: Colors.grey[700],
      //               fontFamily: Almarai
      //           ),
      //           focusedBorder: UnderlineInputBorder(
      //             borderSide: BorderSide(color: Colors.green), // this line changes color
      //           ),
      //
      //         ),
      //       ),
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(5),
      //         color: Colors.white,
      //         boxShadow: [
      //           BoxShadow(
      //             color: Colors.grey.withOpacity(0.5),
      //             spreadRadius: 2,
      //             blurRadius: 3,
      //             offset: Offset(0, 2), // changes position of shadow
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
