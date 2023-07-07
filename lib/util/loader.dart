import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loader {
  Loader._();

  static show() {
    Get.dialog(
        Center(
          child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              width: 50,
              height: 50,
              child: Transform.scale(
                scale: .75,
                child: const CircularProgressIndicator(
                  color: Colors.redAccent,
                ),
              )),
        ),
        barrierDismissible: false,
        barrierColor: Colors.black38);
  }

  static hide() {
    Get.back();
  }
}
