import 'dart:convert';
import 'package:chips_app/constants/appconstants.dart';
import 'package:chips_app/modules/snacks.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart'; // Update with your project name

// class HomeScreenController extends GetxController {
//   // Private variable _count, not observable

//   Map<String, List<Snack>> snacksData = AppConstants.snacksData;
//   // dynamic snacksDataAllList = AppConstants.snacksData;

//   // Combine all snacks into one list
//   final List<Snack> _snacksDataAllList = AppConstants.randomizeList(AppConstants
//       .snacksData.values
//       .expand((categoryList) => categoryList)
//       .toList());

//   // Getter for _count
//   // int get count => _count;
//   dynamic get snacks => snacksData;
//   dynamic get snacksDataAllList => _snacksDataAllList;

//   void removeSnackById(String category, String id) {
//     // Find the category list
//     List<Snack>? snacksList = snacksData[category];

//     update();
//     // Remove the item with the matching id
//     if (snacksList != null) {
//       snacksList.removeWhere((snack) => snack.id == id);
//       update();
//     }
//   }

//   // void removeSnackById(String type, String id) {
//   //   if (type.toLowerCase() == 'all') {
//   //     final index = snacksDataAllList.indexWhere((item) => item.id == id);
//   //     if (index != -1) {
//   //       snacksDataAllList.removeAt(index);
//   //     }
//   //   } else {
//   //     final categorySnacks = snacksData[type.toLowerCase()];
//   //     if (categorySnacks != null) {
//   //       final index = categorySnacks.indexWhere((item) => item.id == id);
//   //       if (index != -1) {
//   //         categorySnacks.removeAt(index);
//   //       }
//   //     }
//   //   }
//   //   update();
//   // }
// }

class HomeScreenController extends GetxController {
  Map<String, List<Snack>> snacksData = AppConstants.snacksData;
  final List<Snack> _snacksDataAllList = AppConstants.randomizeList(AppConstants
      .snacksData.values
      .expand((categoryList) => categoryList)
      .toList());

  dynamic get snacks => snacksData;
  dynamic get snacksDataAllList => _snacksDataAllList;

  void removeSnackById(String category, String id) {
    if (category.toLowerCase() == 'all') {
      _snacksDataAllList.removeWhere((snack) => snack.id == id);
    } else {
      List<Snack>? categoryList = snacksData[category.toLowerCase()];
      if (categoryList != null) {
        categoryList.removeWhere((snack) => snack.id == id);
      }
    }
    update();
  }
}