// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../constants/appconstants.dart';
import '../../contollers/cart_controller.dart';
import '../../widgets/build_header.dart';
import '../../widgets/shapes/hill_shape.dart';
import '../cart list view/cart_list_view.dart';

int _numberOfItems = 1;

final CartController cartController = Get.put(CartController());

class ItemDetailView extends StatefulWidget {
  final String id;
  final String name;
  final String backgroundColor;
  final String subtitle;
  final String type;
  final String imageUrl;
  final double price;

  const ItemDetailView({
    super.key,
    required this.id,
    required this.name,
    required this.backgroundColor,
    required this.subtitle,
    required this.type,
    required this.imageUrl,
    required this.price,
  });

  @override
  State<ItemDetailView> createState() => _ItemDetailViewState();
}

class _ItemDetailViewState extends State<ItemDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // color: Colors.red,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // stops: [0.0, 4.0],
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFebebeb),
              ],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(0),
                  children: [
                    // appbar
                    AppHeader(
                      icon: Icons.arrow_back_ios_new_rounded,
                      textSpan: TextSpan(
                        children: [
                          TextSpan(
                            text: '${widget.name}\n',
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w400,
                              color: AppConstants.kTextColorPrimary,
                            ),
                          ),
                          TextSpan(
                            text: widget.type,
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w700,
                              color: AppConstants.kTextColorPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // prodct name
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            widget.subtitle,
                            style: TextStyle(
                              color: AppConstants.kTextColorPrimary
                                  .withOpacity(.4),
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ).animate().fadeIn(
                          curve: Curves.easeInOut,
                          delay: 300.ms,
                          duration: 800.ms,
                        ),
                    // product image // display
                    Stack(
                      fit: StackFit.passthrough,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            height: 300,
                            // width: 500,
                            // color: Colors.red,
                            child: Image(
                              image: AssetImage(widget.imageUrl),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        // Translucent glass effect with skew
                        Positioned(
                          bottom: -25,
                          left: 115,
                          child: Stack(
                            children: [
                              Transform(
                                // transform: Matrix4.identity()
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.001) // perspective
                                  ..rotateX(.9),
                                // ..rotateY(_offset.dx),
                                alignment: FractionalOffset.center,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(21),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 15, sigmaY: 15),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppConstants.kBackgroundColor,
                                          width: 1,
                                        ),
                                        // color: Colors.red,
                                        borderRadius: BorderRadius.circular(21),
                                        gradient: LinearGradient(
                                          colors: [
                                            AppConstants.kBackgroundColor
                                                .withOpacity(.6),
                                            AppConstants.kBackgroundColor
                                                .withOpacity(.318)
                                          ],
                                        ), // Change to desired color
                                      ),
                                      width: 155,
                                      height: 125,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 45,
                                left: 11,
                                child: Container(
                                  width: 155 - 20,
                                  // color: Colors.yellow,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Pure',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: AppConstants
                                                  .kTextColorPrimary
                                                  .withOpacity(.4),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            widget.name,
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: AppConstants
                                                  .kTextColorPrimary
                                                  .withOpacity(.4),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Text(
                                        '100%',
                                        style: TextStyle(
                                          fontSize: 23,
                                          color: AppConstants.kTextColorPrimary,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ).animate().fadeIn(
                              curve: Curves.easeInOut,
                              duration: 800.ms,
                            ),
                        // BackdropFilter(
                        //   filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        //   child: Container(
                        //     color: Colors.transparent,
                        //   ),
                        // ),
                      ],
                    ),
                    // counter
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // +
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _numberOfItems = _numberOfItems + 1;
                              print(_numberOfItems);
                            });
                          },
                          // color: Colors.red,
                          child: const Stack(
                            children: [
                              HillShape(),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                      fontSize: 47,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ).animate().fadeIn(
                                curve: Curves.easeInOut,
                                delay: 300.ms,
                                duration: 800.ms,
                              ),
                        ),
                        // nam and cost
                        Column(
                          children: [
                            Text(
                              _numberOfItems < 10
                                  ? '0$_numberOfItems'
                                  : '$_numberOfItems',
                              style: TextStyle(
                                  fontSize: 46,
                                  fontWeight: FontWeight.w700,
                                  color: AppConstants.kTextColorPrimary),
                            ).animate().fadeIn(
                                  curve: Curves.easeOut,
                                  duration: 800.ms,
                                ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                // color: Colors.blue,
                                color: AppConstants.kSecondaryColor2,
                                borderRadius: BorderRadius.circular(44),
                              ),
                              child: Text(
                                '\$ ${widget.price * _numberOfItems}',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: AppConstants.kTextColorPrimary),
                              ),
                            ).animate().fadeIn(
                                  curve: Curves.easeInOut,
                                  delay: 300.ms,
                                  duration: 800.ms,
                                ),
                          ],
                        ),
                        // -
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_numberOfItems >= 0) {
                                _numberOfItems = 0;
                              } else {
                                _numberOfItems = _numberOfItems - 1;
                              }
                              print(_numberOfItems);
                            });
                          },
                          // color: Colors.red,
                          child: Stack(
                            children: [
                              Transform.flip(
                                flipX: true,
                                child: const HillShape(),
                              ),
                              const Positioned.fill(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                      fontSize: 47,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ).animate().fadeIn(
                                curve: Curves.easeInOut,
                                delay: 300.ms,
                                duration: 800.ms,
                              ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              // add to cart
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  // color: AppConstants.kSecondaryColor2,
                  borderRadius: BorderRadius.circular(53.35),
                ),
                margin: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 35),
                      child: const Text(
                        'Add to cart',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Add to cart logic here
                        cartController.addToCart(
                          id: widget.id,
                          title: '${widget.name} x$_numberOfItems',
                          subtitle: widget.subtitle,
                          type: widget.type,
                          price: widget.price * _numberOfItems,
                          backgroundColor: widget.backgroundColor,
                          image: widget.imageUrl,
                        );

                        Get.to(() => const CartListView());
                      },
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        width: 95,
                        height: 70,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppConstants.kSecondaryColor2,
                          borderRadius: BorderRadius.circular(53.35),
                        ),
                        child: const Icon(
                          Icons.shopping_cart,
                          color: AppConstants.kTextColorPrimary,
                          size: 32,
                        ),
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(
                    curve: Curves.easeInOut,
                    delay: 300.ms + 800.ms,
                    duration: 800.ms,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedTrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double topWidth = size.width * 0.7; // Width of the top side
    double cornerRadius = 20.0; // Radius for rounded corners
    double topOffset = (size.width - topWidth) / 2; // Offset for top side

    Path path = Path();

    // Start at the top-left corner
    path.moveTo(topOffset + cornerRadius, 0);

    // Top straight line
    path.lineTo(topOffset + topWidth - cornerRadius, 0);

    // Top-right corner curve
    path.quadraticBezierTo(
      topOffset + topWidth,
      0,
      topOffset + topWidth,
      cornerRadius,
    );

    // Right slant
    path.lineTo(size.width - cornerRadius, size.height - cornerRadius);

    // Bottom-right corner curve (fixed)
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - cornerRadius,
      size.height,
    );

    // Bottom straight line
    path.lineTo(cornerRadius, size.height);

    // Bottom-left corner curve
    path.quadraticBezierTo(
      0,
      size.height,
      cornerRadius,
      size.height - cornerRadius,
    );

    // Left slant
    path.lineTo(topOffset, cornerRadius);

    // Top-left corner curve
    path.quadraticBezierTo(
      topOffset,
      0,
      topOffset + cornerRadius,
      0,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
