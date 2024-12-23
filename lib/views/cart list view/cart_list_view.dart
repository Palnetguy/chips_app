// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import 'package:chips_app/constants/appconstants.dart';
import 'package:chips_app/widgets/shapes/valley_shape.dart';

import '../../contollers/cart_controller.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<CartController>(
          init: CartController(),
          initState: (_) {},
          builder: (_) {
            return Column(
              children: [
                // aPP BAR
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    children: [
                      const Text(
                        'Cart',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 44,
                        height: 44,
                        decoration: const BoxDecoration(
                          color: AppConstants.kCatIconColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            cartController.cartData.length.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              color: AppConstants.kTextColorPrimary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                    .animate()
                    .slide(
                      begin: Offset(0, -.3), // Start from below (y = 1)
                      end: Offset(0, 0), // End at normal position (y = 0)
                      curve: Curves.easeInOut,
                      duration: 600.ms,
                    )
                    .scaleX(
                      begin: 1.1, // Start slightly larger
                      end: 1.0, // End at normal size
                      curve: Curves.easeOut, // Smooth easing
                      duration: 600.ms, // Animation duration
                    ),
                // LIST
                Expanded(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          const ValleyShape(
                            child: Text(''),
                            padding: EdgeInsets.all(40),
                            color: AppConstants.kTextColorPrimary,
                          ),
                          Expanded(
                            child: Container(
                              color: AppConstants.kTextColorPrimary,
                            ),
                          )
                        ],
                      ),
                      // Content
                      Padding(
                        padding: EdgeInsets.only(top: 50, left: 30, right: 30),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 320,
                              child: ListView(
                                padding: EdgeInsets.all(0),
                                shrinkWrap: true,
                                children:
                                    cartController.cartData.map<Widget>((e) {
                                  final index = cartController.cartData
                                      .indexOf(e); // Get the index for delay
                                  return Animate(
                                    effects: [
                                      SlideEffect(
                                        begin: Offset(
                                            1.5, 0.0), // Start from the right
                                        end: Offset(
                                            0.0, 0.0), // End at normal position
                                        // curve: Curves.easeOut,
                                        duration: Duration(milliseconds: 300),
                                      ),
                                    ],
                                    delay: Duration(
                                        milliseconds: index *
                                            300), // Delay by index for staggered effect
                                    child: _ProductModuleCart(
                                      image: e.image,
                                      title: e.title,
                                      subtitle: e.subtitle,
                                      price: e.price.toString(),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),

                            // Delivery Amount

                            _DeliveryAmount(
                              deliveryAmount:
                                  cartController.cartData.isEmpty ? 0 : 5.00,
                              total: (AppConstants.sumList(cartController
                                  .cartData
                                  .map((item) => item.price.toDouble())
                                  .toList())),
                              images: cartController.cartData
                                  .map((item) => item.image as String)
                                  .toList(),
                            ).animate().slide(
                                  delay: cartController.cartData.length > 4
                                      ? 300.ms * 4
                                      : 300.ms * cartController.cartData.length,
                                  begin:
                                      Offset(-1.5, 0.0), // Start from the right
                                  end: Offset(0.0, 0.0),
                                  curve: Curves.easeOut, // Smooth easing
                                  duration: 600.ms, // Animation duration
                                ),
                            const Spacer(),
                            // make payment
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding: const EdgeInsets.only(
                                left: 30,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    'Make Payment',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: AppConstants.kTextColorPrimary,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    margin: const EdgeInsets.all(3),
                                    width: 75,
                                    height: 64,
                                    decoration: BoxDecoration(
                                      color: AppConstants.kCatIconColor,
                                      // shape: BoxShape.circle,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.keyboard_arrow_right_rounded,
                                        size: 40,
                                        color: AppConstants.kTextColorPrimary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ).animate().slideY(
                                  delay: (cartController.cartData.length > 4
                                          ? 300.ms * 4
                                          : 300.ms *
                                              cartController.cartData.length) +
                                      600.ms,
                                  begin: 1, // Start from the right
                                  end: 0,
                                  curve: Curves.easeOut, // Smooth easing
                                  duration: 600.ms, // Animation duration
                                ),
                          ],
                        ),
                      ),
                      // test

                      // small dash
                      Align(
                        alignment: const Alignment(-.05, -1.005),
                        child: Container(
                          width: 50,
                          height: 4,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE0E0E0),
                            borderRadius: BorderRadius.circular(44),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                spreadRadius: 0,
                                color: Colors.black.withOpacity(.3),
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _AdjustablePivotCardSpreadWidget extends StatelessWidget {
  final List<ImageProvider> images; // List of images to display
  final double cardWidth; // Width of each card
  final double cardHeight; // Height of each card
  final double spreadAngle; // Total angle for spreading the cards
  final bool startFromLeft; // Toggle to control where the rotation starts

  const _AdjustablePivotCardSpreadWidget({
    required this.images,
    this.cardWidth = 100,
    this.cardHeight = 150,
    this.spreadAngle = 60, // Total spread angle in degrees
    this.startFromLeft = true, // Default to starting from left
  });

  @override
  Widget build(BuildContext context) {
    final double angleStep =
        spreadAngle / (images.length - 1); // Step between angles
    final double startAngle = startFromLeft
        ? -spreadAngle / 2
        : spreadAngle / 2; // Control start side

    return SizedBox(
      // width: cardWidth + (images.length * 20), // Adjust width for spread
      height: cardHeight + 50, // Adjust height for layout
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          for (int i = 0; i < images.length; i++)
            Transform(
              alignment: Alignment.bottomCenter, // Pivot at the bottom
              transform: Matrix4.identity()
                ..rotateZ(
                    (startAngle + (i * (startFromLeft ? 1 : -1) * angleStep)) *
                        (pi / 180)), // Adjust for direction
              child: Container(
                width: cardWidth,
                height: cardHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: images[i],
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 8,
                      offset: Offset(3, 5), // Subtle shadow effect
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _DeliveryAmount extends StatelessWidget {
  final double deliveryAmount;
  final double total;
  final List images;
  const _DeliveryAmount({
    required this.deliveryAmount,
    required this.total,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Container(
        height: 200,
        child: Stack(
          children: [
            ValleyShape(
              child: Text(''),
              padding: EdgeInsets.only(
                top: 40,
                left: 40,
                right: 40,
              ),
              color: AppConstants.kCatIconColor,
              radius: 40,
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Transform.flip(
                  flipY: true,
                  child: ValleyShape(
                    child: Text(''),
                    padding: EdgeInsets.all(40),
                    color: AppConstants.kCatIconColor,
                  ),
                ),
              ],
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Amount',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppConstants.kTextColorPrimary,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '\$$deliveryAmount ',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppConstants.kTextColorPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: 5),
                  Divider(
                    color: AppConstants.kTextColorPrimary.withOpacity(0.3),
                    thickness: 1.5,
                  ),
                  // SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text(
                          'Total Amount',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppConstants.kTextColorPrimary,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        subtitle: Text(
                          'USD ${(total + deliveryAmount).toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w700,
                            color: AppConstants.kTextColorPrimary,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              right: -20,
              bottom: -30,
              child: _AdjustablePivotCardSpreadWidget(
                cardHeight: 130,
                spreadAngle: 45, // Adjust for tighter or wider spreads
                startFromLeft: false,
                images: images.map((e) => AssetImage(e)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductModuleCart extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String price;

  const _ProductModuleCart({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // img
        Container(
          margin: const EdgeInsets.only(bottom: 40),
          width: 70,
          height: 70,
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
        ),
        // Tirtles
        const SizedBox(width: 23),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: AppConstants.kTextColorLight,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 13,
                color: AppConstants.kTextColorLight.withOpacity(.4),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        // cost
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            '\$$price',
            style: TextStyle(
              fontSize: 14,
              color: AppConstants.kTextColorPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
