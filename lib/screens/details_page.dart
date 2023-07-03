import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneakerlabs/models/product.dart';
import 'package:unicons/unicons.dart';
import 'package:get/get.dart';

import '../data/shoes.dart';
import '../widgets/detailsPage/build_details_category.dart';
import '../widgets/detailsPage/build_follow_button.dart';
import '../widgets/homePage/shoes_wisget/build_shoes.dart';

class DetailsPage extends StatefulWidget {
  final ProductModel productModel;

  const DetailsPage({Key? key, required this.productModel}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
              widget.productModel.name,
              style: GoogleFonts.lato(
                fontSize: size.width * 0.045,
                color: isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              right: size.width * 0.05,
            ),
            child: SizedBox(
              height: size.width * 0.1,
              width: size.width * 0.1,
              child: Container(
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? const Color(0xff0f0f0f) //bd color
                      : const Color(0xffebebeb),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Icon(
                  UniconsLine.shopping_cart_alt,
                  color: isDarkMode
                      ? Colors.white //icon color
                      : const Color(0xff3b22a1),
                  size: size.height * 0.028,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xff0f0f0f) : const Color(0xffebebeb),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              buildDetailsCategory('Selected Offer', size, isDarkMode),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.008,
                  horizontal: size.width * 0.03,
                ),
                child: Container(
                  height: size.height * 0.25,
                  decoration: BoxDecoration(
                    color: isDarkMode ? const Color(0xff0a0a0a) : Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: size.height * 0.035,
                          ),
                          child: widget.productModel.isRotated
                              ? Image.network(
                                  widget.productModel.image,
                                  loadingBuilder: (
                                    context,
                                    child,
                                    loadingProgress,
                                  ) {
                                    if (loadingProgress == null) {
                                      return Image.network(
                                        widget.productModel.image,
                                        width: size.width * 0.3,
                                        fit: BoxFit.cover,
                                      );
                                    } else {
                                      return const CircularProgressIndicator
                                          .adaptive();
                                    }
                                  },
                                  errorBuilder: (
                                    context,
                                    error,
                                    stackTrace,
                                  ) {
                                    return const CircularProgressIndicator
                                        .adaptive();
                                  },
                                )
                              : Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationY(pi),
                                  child: Image.network(
                                    widget.productModel.image,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return Image.network(
                                          widget.productModel.image,
                                          width: size.width * 0.52,
                                        );
                                      } else {
                                        return const CircularProgressIndicator
                                            .adaptive();
                                      }
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return const CircularProgressIndicator
                                          .adaptive();
                                    },
                                    width: size.width * 0.4,
                                  ),
                                ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.productModel.name,
                                style: GoogleFonts.lato(
                                  fontSize: size.width * 0.036,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
                                ),
                              ),
                              Text(
                                "₹ ${widget.productModel.price}".toString(),
                                style: GoogleFonts.lato(
                                  fontSize: size.width * 0.036,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.9,
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: size.height * 0.01,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.productModel.description,
                                  style: GoogleFonts.lato(
                                    fontSize: size.width * 0.03,
                                    color: isDarkMode
                                        ? Colors.white.withOpacity(0.7)
                                        : Colors.black.withOpacity(0.7),
                                  ),
                                ),
                                Text(
                                  "EU ${widget.productModel.size}",
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03,
                ),
                child: Container(
                  height: size.height * 0.07,
                  decoration: BoxDecoration(
                    color: isDarkMode ? const Color(0xff0a0a0a) : Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                        ),
                        child: CircleAvatar(
                          foregroundImage: NetworkImage(
                            widget.productModel.userImage,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.013,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.productModel.userName,
                              style: GoogleFonts.lato(
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            Text(
                              "Followers ${widget.productModel.userFollowers}",
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
                      buildFollowButton(size, isDarkMode),
                    ],
                  ),
                ),
              ),
              buildDetailsCategory("Other similar offers", size, isDarkMode),
              SizedBox(
                height: size.height * 0.78,
                child: ListView.builder(
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: shoes.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, i) {
                    return SizedBox(
                      child: buildShoes(size, isDarkMode, i),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
