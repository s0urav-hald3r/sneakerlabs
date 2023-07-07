import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetUtil {
  @swidget
  Widget titleText(String title) {
    return Text(
      title,
      style: GoogleFonts.lato(fontWeight: FontWeight.w600, fontSize: 24),
    );
  }

  @swidget
  Widget customTextField(
    TextEditingController controller, {
    String hintText = '',
    bool obscureText = false,
    textInputType = TextInputType.text,
    double width = double.infinity,
    TextAlign textAlign = TextAlign.start,
    Widget? suffixIcon,
    Widget? prefixIcon,
    bool readOnly = false,
    Function? onTap,
    Function(String)? onChanged,
    double height = 50,
    double left = 20,
    double right = 0,
    double top = 0,
    double bottom = 0,
    String? suffixText,
    List<TextInputFormatter>? formatters,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        textAlign: textAlign,
        controller: controller,
        onChanged: onChanged,
        obscureText: obscureText,
        keyboardType: textInputType,
        cursorColor: Colors.black,
        readOnly: readOnly,
        style: GoogleFonts.lato(fontWeight: FontWeight.w500, fontSize: 18),
        inputFormatters: formatters,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
              top: top, left: left, right: right, bottom: bottom),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          suffixText: suffixText,
          suffixStyle:
              GoogleFonts.lato(fontWeight: FontWeight.w500, fontSize: 18),
          suffixIconColor:
              MaterialStateColor.resolveWith((states) => Colors.grey.shade800),
          errorStyle: const TextStyle(height: 0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white, width: 0.0)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white, width: 0.0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white, width: 0.0)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white, width: 0.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white, width: 0.0)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white, width: 0.0)),
          filled: true,
          fillColor: Colors.grey.shade200,
          hintText: hintText,
          hintStyle: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.grey.shade600),
        ),
      ),
    );
  }
}
