import 'dart:ui';

import 'package:flutter/material.dart';

import '../../constants/appconstants.dart';
import '../../widgets/build_header.dart';
import '../../widgets/shapes/hill_shape.dart';

class ItemDetailView extends StatelessWidget {
  const ItemDetailView({super.key});

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
                    const AppHeader(
                      icon: Icons.arrow_back_ios_new_rounded,
                      textSpan: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Coconut\n',
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w400,
                              color: AppConstants.kTextColorPrimary,
                            ),
                          ),
                          TextSpan(
                            text: 'Chips',
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
                            'Dang',
                            style: TextStyle(
                              color: AppConstants.kTextColorPrimary
                                  .withOpacity(.4),
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
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
                            child: const Image(
                              image: AssetImage('assets/images/dang.png'),
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
                                left: 20,
                                child: Container(
                                  width: 155 - 40,
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
                                              fontSize: 12,
                                              color: AppConstants
                                                  .kTextColorPrimary
                                                  .withOpacity(.4),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            'Coconut',
                                            style: TextStyle(
                                              fontSize: 12,
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
                                          fontSize: 24,
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
                        Container(
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
                          ),
                        ),
                        // nam and cost
                        Column(
                          children: [
                            const Text(
                              '03',
                              style: TextStyle(
                                  fontSize: 46,
                                  fontWeight: FontWeight.w700,
                                  color: AppConstants.kTextColorPrimary),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                // color: Colors.blue,
                                color: AppConstants.kSecondaryColor2,
                                borderRadius: BorderRadius.circular(44),
                              ),
                              child: const Text(
                                '\$ 06.00',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: AppConstants.kTextColorPrimary),
                              ),
                            ),
                          ],
                        ),
                        // -
                        Container(
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
                    Container(
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
                  ],
                ),
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
