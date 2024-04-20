import 'package:flutter/material.dart';
import 'package:printing_costs_2/core/widgets/app_bar.dart';
import 'package:printing_costs_2/core/widgets/text_style.dart';
import 'package:printing_costs_2/srevices/repository.dart';
class SettingView extends StatefulWidget {
  Repository repository;
   SettingView({Key? key,required this.repository}) : super(key: key);

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: APPBAR(h:h,w: w,context: context,text:"الأعدادات"),
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body: Padding(
        padding:
        EdgeInsets.only(left: w * 0.02, right: w * 0.02, top: h * 0.15),
        child: Column(
          children: [
            // SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Checkbox(
                  value: widget.repository.check1,
                  fillColor: MaterialStateProperty.all(Colors.blue),
                  onChanged: (bool? value) {
                    setState(() {
                      widget.repository.check1 = value;
                    });
                    // totalPrice();
                  },
                  // activeColor: Colors.blue,
                ),
                TEXT(text: "إشراف",w: w * 0.035),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Checkbox(
                    value: widget.repository.check2,
                    fillColor: MaterialStateProperty.all(Colors.blue),
                    onChanged: (bool? value) {
                      setState(() {
                        widget.repository.check2 = value;
                      });
                      // totalPrice();
                    }),
                TEXT(text:"عضوية",w: w * 0.035),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
