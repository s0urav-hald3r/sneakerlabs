import 'package:get/get.dart';

import '../models/product.dart';

class ProductController extends GetxController {
  var cartItems = <ProductModel>[].obs;

  addToCart(ProductModel productModel) {
    cartItems.add(productModel);
  }

  removeFromCart(ProductModel productModel) {
    cartItems.remove(productModel);
    if (cartItems.isEmpty) {
      Get.back();
    }
  }

  placeOrder() {
    cartItems.clear();
    Get.back();
    Get.back();
  }

  int get totalCartItems => cartItems.length;

  double get totalCartValue =>
      cartItems.fold(0, (total, item) => total + item.pAmout!);
}
