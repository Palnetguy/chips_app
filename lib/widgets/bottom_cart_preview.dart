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

class BottomCartPreview extends StatelessWidget {
  const BottomCartPreview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());

    return GetBuilder<CartController>(
      init: CartController(),
      initState: (_) {},
      builder: (_) {
        final List<String> itemImages =
            cartController.cartData.map((e) => e.image).toList();
        return GestureDetector(
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
                  padding: EdgeInsets.only(left: 35, right: 43),
                  color: AppConstants.kBlackBorder,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // bottom cart content
                      Row(
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
                              SizedBox(width: 20),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                    '${itemImages.length.toString()} Item',
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
                        ],
                      ),
                      // list of cart summary
                      itemImages.length == 0
                          ? Row(
                              children: itemImages
                                  .map(
                                    (e) => _PreviewListModule(
                                      imageUrl: e,
                                    ),
                                  )
                                  .toList())
                          : Row(
                              children: itemImages
                                  .map(
                                    (e) => _PreviewListModule(
                                      imageUrl: e,
                                    ),
                                  )
                                  .toList()
                                  .sublist(0, 5),
                            )
                    ],
                  ),
                ),
                // small dash
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
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _PreviewListModule extends StatelessWidget {
  final String imageUrl;
  const _PreviewListModule({
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      widthFactor: .5,
      child: Container(
        width: 60,
        height: 60,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10000),
          border: Border.all(
            color: AppConstants.kBlackBorder,
            width: 2,
          ),
        ),
        child: Image.asset(
          // 'assets/images/dang.png',
          imageUrl,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
