import 'package:flutter/material.dart';
import 'package:printing_costs_2/constants.dart';
class BoxLogin extends StatefulWidget {
  TextEditingController controller;
  String label;
  TextInputType textInputType;
  bool pass;
  bool ispassword ;
  BoxLogin({Key? key, required this.controller, required this.label,required this.textInputType, required this.pass, required this.ispassword}) : super(key: key);

  @override
  _BoxLoginState createState() => _BoxLoginState();
}

class _BoxLoginState extends State<BoxLogin> {
  @override
  Widget build(BuildContext context) {
    return   Container(
      margin:
      EdgeInsets.only(top: MediaQuery
          .of(context)
          .size
          .height * 0.015),
      child: TextFormField(
        textDirection: TextDirection.ltr,
        controller: widget.controller,
        style: TextStyle(
          color: Colors.black,
          fontSize: MediaQuery
              .of(context)
              .size
              .height * 0.017,
          fontWeight: FontWeight.w500,
          fontFamily: Almarai,
        ),
        // cursorColor: primarycolor,
        keyboardType: widget.textInputType,
        onFieldSubmitted: (val) {
          debugPrint(val);
        },
        obscureText: widget.pass ? widget.ispassword : false,
        validator: (value) {
          if (value!.isEmpty) {
            return 'الحقل مطلوب';
          }
          return null;
        },
        maxLines: 1,
        decoration: InputDecoration(
          // hintTextDirection: TextDirection.rtl,

            floatingLabelStyle: TextStyle(color: Colors.blue),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            label: Text(widget.label,
              style: TextStyle(
                fontFamily: Almarai,
              ),),
            contentPadding: EdgeInsets.only(bottom: 0),
            suffixIcon: widget.pass
                ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.ispassword = !widget.ispassword;
                  });
                },
                icon: Icon(
                  widget.ispassword ? Icons.visibility_off : Icons.visibility,
                  size: MediaQuery.of(context).size.height * 0.02,
                ))
                : null
        ),
      ),
    );
  }
}
