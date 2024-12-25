import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/appconstants.dart';
import 'helper/init_controller.dart';
import 'views/cart collections view/cart_collections_view.dart';
import 'views/cart list view/cart_list_view.dart';
import 'views/home view/home_screen.dart';
import 'views/item detail view/item_detail_view.dart';
import 'views/test screen/test_screen.dart';

void main() {
  runApp(const SnacksApp());
}

class SnacksApp extends StatelessWidget {
  const SnacksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    
      debugShowCheckedModeBanner: false,
      initialBinding: InitControllers(),
      theme: ThemeData(
        fontFamily: 'SF Pro Display',
      ),
      home: const CartCollections(),
    ); 
  }
}
