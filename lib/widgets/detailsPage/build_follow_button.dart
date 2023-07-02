import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURL() async {
  const url = 'https://www.flipkart.com/';
  if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
  } else {
    throw 'Could not launch $url';
  }
}

Padding buildFollowButton(Size size, bool isDarkMode) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: size.width * 0.04,
    ),
    child: SizedBox(
      height: size.height * 0.043,
      width: size.width * 0.28,
      child: InkWell(
        onTap: () {
          _launchURL();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          child: Align(
            child: Text(
              'Contact to buy',
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
    ),
  );
}
