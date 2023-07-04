import 'package:get/get.dart';

import '../models/product.dart';

class ProductController extends GetxController {
  var cartItems = <ProductModel>[].obs;

  addToCart(ProductModel productModel) {
    cartItems.add(productModel);
  }

  removeFromCart(ProductModel productModel) {
    cartItems.remove(productModel);
  }

  placeOrder() {
    cartItems.clear();
  }

  int get totalCartItems => cartItems.length;
}
