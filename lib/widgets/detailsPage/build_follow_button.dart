import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Padding buildFollowButton(Size size, bool isDarkMode) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: size.width * 0.04,
    ),
    child: SizedBox(
      height: size.height * 0.043,
      width: size.width * 0.28,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        child: Align(
          child: Text(
            'Add to cart',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: isDarkMode ? Colors.black : Colors.white,
              fontSize: size.width * 0.035,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}
