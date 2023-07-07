import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSnackBar {
  CustomSnackBar._();

  static show(String title, {String? message, int type = 0}) {
    Color? bgColor;
    Color? textColor = Colors.white;
    switch (type) {
      case 0:
        bgColor = Colors.green.withOpacity(0.75);
        break;
      case 1:
        bgColor = Colors.amber.withOpacity(0.5);
        textColor = Colors.black;
        break;
      case 2:
        bgColor = Colors.red.withOpacity(0.75);
        break;
      default:
    }
    Get.snackbar('', '',
        titleText: Text(
          title,
          style: GoogleFonts.lato(
              fontSize: 20, color: textColor, fontWeight: FontWeight.bold),
        ),
        messageText: message != null
            ? Text(
                message,
                style: GoogleFonts.lato(fontSize: 16, color: textColor),
              )
            : null,
        backgroundColor: bgColor);
  }
}
