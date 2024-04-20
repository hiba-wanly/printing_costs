import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:printing_costs_2/constants.dart';
class APPBAR extends StatelessWidget implements PreferredSizeWidget{
  double h;
  double w ;
  BuildContext context;
  String text;
   APPBAR({Key? key,required this.h,required this.w,required this.context,required this.text}) : super(key: key);

  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(h * 0.09),
      child: AppBar(
        title:  Text(
          text,
          style: TextStyle(
            fontFamily: Almarai,
            fontSize: w* 0.06,
            color: Colors.black,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(0.1, 0.1),
                blurRadius: 3.0,
                color: Color.fromARGB(0, 0, 0, 0),
              ),
              Shadow(
                offset: Offset(0.1, 0.1),
                blurRadius: 8.0,
                color: Color.fromARGB(125, 0, 0, 255),
              ),
            ],
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClayContainer(
              emboss: true,
              color: Color(0xFFF2F2F2),
              borderRadius: 50,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(25),
              //   color: Colors.white,
              //   boxShadow: [
              //     BoxShadow(
              //       color: Colors.grey.withOpacity(1),
              //       spreadRadius: 2,
              //       blurRadius: 3,
              //       offset: Offset(2, 4), // changes position of shadow
              //     ),
              //   ],
              // ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: w * 0.06,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  Size.fromHeight(h * 0.09);
  // Size get preferredSize => throw UnimplementedError();
}
