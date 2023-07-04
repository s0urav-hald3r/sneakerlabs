import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneakerlabs/controller/product_controller.dart';

Padding buildCartShoes(
    Size size, bool isDarkMode, int i, ProductController productController) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: size.width * 0.03,
      vertical: size.height * 0.015,
    ),
    child: Container(
      height: size.height * 0.08,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xff0a0a0a) : Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          productController.cartItems[i].isRotated
              ? Image.network(
                  productController.cartItems[i].image,
                  errorBuilder: (context, error, stackTrace) {
                    return const CircularProgressIndicator.adaptive();
                  },
                  width: size.width * 0.18,
                )
              : Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(pi),
                  child: Image.network(
                    productController.cartItems[i].image,
                    errorBuilder: (context, error, stackTrace) {
                      return const CircularProgressIndicator.adaptive();
                    },
                    width: size.width * 0.18,
                  ),
                ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.06,
              vertical: size.height * 0.019,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productController.cartItems[i].name,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lato(
                    fontSize: size.width * 0.035,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  productController.cartItems[i].description,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lato(
                    fontSize: size.width * 0.03,
                    color: isDarkMode
                        ? Colors.white.withOpacity(0.7)
                        : Colors.black.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.019,
              horizontal: size.width * 0.012,
            ),
            child: Column(
              children: [
                Text(
                  "₹ ${productController.cartItems[i].price}".toString(),
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lato(
                    fontSize: size.width * 0.035,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  "EU ${productController.cartItems[i].size}".toString(),
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lato(
                    fontSize: size.width * 0.03,
                    color: isDarkMode
                        ? Colors.white.withOpacity(0.7)
                        : Colors.black.withOpacity(0.7),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
