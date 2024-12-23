import 'dart:convert';
import 'package:chips_app/constants/appconstants.dart';
import 'package:chips_app/modules/snacks.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart'; // Update with your project name

class HomeScreenController extends GetxController {
  // Private variable _count, not observable

  Map<String, List<Snack>> snacksData = AppConstants.snacksData;
  // dynamic snacksDataAllList = AppConstants.snacksData;

  // Combine all snacks into one list
  final List<Snack> _snacksDataAllList = AppConstants.randomizeList(AppConstants
      .snacksData.values
      .expand((categoryList) => categoryList)
      .toList());

  // Getter for _count
  // int get count => _count;
  dynamic get snacks => snacksData;
  dynamic get snacksDataAllList => _snacksDataAllList;

  // Observable variable for Snacks data
  // var snacks = Rx<Snacks?>(null);

  // Method to increment _count
  // void increment() {
  //   _count++;
  //   update(); // This will trigger GetBuilder to rebuild the widget
  // }

  // Method to load and parse the JSON data
  // Future<void> loadSnacksData() async {
  //   // Load the JSON file from assets
  //   String jsonString = await rootBundle.loadString('assets/data/snacks.json');

  //   // Decode the JSON string into a Map
  //   Map<String, dynamic> jsonMap = jsonDecode(jsonString);

  //   // Convert the map into a Snacks object and update the observable variable
  //   snacks.value = Snacks.fromJson(jsonMap);
  // }

  void removeSnackById(String category, String id) {
    // Find the category list
    List<Snack>? snacksList = snacksData[category];

    update();
    // Remove the item with the matching id
    if (snacksList != null) {
      snacksList.removeWhere((snack) => snack.id == id);
      update();
    }
  }
}
