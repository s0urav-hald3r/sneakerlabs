import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sneakerlabs/screens/home_page.dart';
import 'package:unicons/unicons.dart';

import '../controller/product_controller.dart';
import '../widgets/homePage/shoes_wisget/build_cart_shoes.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final ProductController _productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        backgroundColor: isDarkMode
            ? const Color(0xff0f0f0f) //bg color
            : const Color(0xffebebeb),
        leading: Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.008,
          ),
          child: SizedBox(
            height: size.height * 0.1,
            width: size.width * 0.1,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? const Color(0xff0f0f0f)
                      : const Color(0xffebebeb),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Icon(
                  UniconsLine.arrow_circle_left,
                  color: isDarkMode ? const Color(0xff314d78) : Colors.indigo,
                ),
              ),
            ),
          ),
        ),
        titleSpacing: 0,
        leadingWidth: size.width * 0.13,
        title: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(
              right: size.width * 0.1,
            ),
            child: Text(
              'Cart',
              style: GoogleFonts.lato(
                fontSize: size.width * 0.045,
                color: isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (_productController.cartItems.isEmpty) {
          return Center(
              child: Text(
            'No cart items available',
            style: GoogleFonts.lato(
              fontSize: size.width * 0.045,
              color: isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ));
        }
        return SizedBox(
          width: size.width,
          height: size.height * 0.78,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: _productController.cartItems.length,
            itemBuilder: (context, i) {
              return Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          _productController
                              .removeFromCart(_productController.cartItems[i]);
                        },
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        borderRadius: BorderRadius.circular(10),
                        padding: EdgeInsets.zero,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child:
                      buildCartShoes(size, isDarkMode, i, _productController));
            },
          ),
        );
      }),
      floatingActionButton: Obx(() => _productController.cartItems.isEmpty
          ? const SizedBox.shrink()
          : FloatingActionButton.extended(
              backgroundColor: const Color(0xff314d78),
              onPressed: () {
                _productController.placeOrder();
                Get.dialog(Lottie.asset('assets/success.json'),
                    barrierColor: Colors.white);
                Future.delayed(const Duration(seconds: 3),
                    () => Get.offAll(const HomePage()));
              },
              label: Text(
                'Buy now',
                style: GoogleFonts.lato(
                  fontSize: size.width * 0.045,
                  color: !isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
    );
  }
}
