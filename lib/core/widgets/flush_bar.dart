import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class FlashBAR extends StatelessWidget {
  String message;
  double h;
  BuildContext context1;
  FlashBAR(
      {Key? key, required this.message, required this.h, required this.context1})
      : super(key: key);

  _showFlushbar(BuildContext context) {
    Flushbar(
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.white,
      messageColor: Colors.black,
      messageSize: h * 0.02,
      message: message,
    ).show(context1);
  }

  @override
  Widget build(BuildContext context) {
    return _showFlushbar(context1);
  }
}
