// Home screen of the application

import 'dart:ui';
import 'package:chips_app/constants/appconstants.dart';
import 'package:chips_app/views/cart%20collections%20view/cart_collections_view.dart';
import 'package:chips_app/views/cart%20list%20view/cart_list_view.dart';
import 'package:chips_app/widgets/shapes/valley_shape.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contollers/cart_controller.dart';
import '../contollers/cart_view_collectons_controller.dart';

class BottomCartPreview extends StatefulWidget {
  const BottomCartPreview({
    super.key,
  });

  @override
  _BottomCartPreviewState createState() => _BottomCartPreviewState();
}

class _BottomCartPreviewState extends State<BottomCartPreview>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start off-screen (bottom)
      end: Offset.zero, // End at normal position
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Initialize CartController
    Get.put(CartController());
  }

  void _checkCartAndAnimate() {
    final cartController = Get.find<CartController>();
    if (cartController.cartData.isNotEmpty) {
      _animationController.forward(); // Trigger slide-in animation
    } else {
      _animationController.reverse(); // Hide if no items
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (cartController) {
        // Check the cart and trigger animation dynamically
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _checkCartAndAnimate();
        });

        final List<String> itemImages =
            cartController.cartData.map((e) => e.image).toList();

        return SlideTransition(
          position: _slideAnimation,
          child: GestureDetector(
            onTap: () {
              Get.to(() => const CartListView());
            },
            child: Container(
              height: 110,
              width: double.infinity,
              color: Colors.transparent,
              child: Stack(
                children: [
                  ValleyShape(
                    padding: const EdgeInsets.only(left: 35, right: 43),
                    color: AppConstants.kBlackBorder,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: AppConstants.kSecondaryColor,
                                borderRadius: BorderRadius.circular(1000),
                              ),
                              child: Center(
                                child: Text(
                                  itemImages.length.toString(),
                                  style: TextStyle(
                                    color: AppConstants.kTextColorPrimary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cart',
                                  style: TextStyle(
                                    color: AppConstants.kTextColorLight,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  '${itemImages.length} Item(s)',
                                  style: TextStyle(
                                    color: AppConstants.kTextColorLight
                                        .withOpacity(.4),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: itemImages
                              .take(4)
                              .map((e) => _PreviewListModule(imageUrl: e))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const Alignment(-.05, -1.03),
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
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class _PreviewListModule extends StatelessWidget {
  final String imageUrl;
  const _PreviewListModule({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      widthFactor: .5,
      child: Container(
        width: 60,
        height: 60,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10000),
          border: Border.all(
            color: AppConstants.kBlackBorder,
            width: 2,
          ),
        ),
        child: Image.asset(
          imageUrl,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.error,
              color: Colors.red,
            ); // Default error icon
          },
        ),
      ),
    );
  }
}
