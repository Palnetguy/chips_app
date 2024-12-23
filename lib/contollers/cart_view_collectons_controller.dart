import 'package:chips_app/constants/appconstants.dart';
import 'package:chips_app/modules/snacks.dart';
import 'package:get/get.dart';

class CollectionsController extends GetxController {
  // Initial snacks data
  Map<String, List<Snack>> snacksData = AppConstants.snacksData;
  Map<String, List<Snack>> snacksDataEach = AppConstants.snacksData;

  String _currentCategory = 'choco';
  // Map<String, List<Snack>> snacksDataEach = AppConstants.snacksData;

  // Get function to fetch the snacks data
  dynamic get snacks => snacksData;
  String get currentCategory => _currentCategory;

  // Function to update the list of snacks for a specific category
  void updateSnacks(String category) {
    snacksDataEach =
        AppConstants.snacksData[category] as Map<String, List<Snack>>;
    update(); // This triggers an update in the UI when using GetX
  }

  void categoryChanged() {
    // This triggers an update in the UI when using GetX
    update();
  }

  void updateCategory({String newCategory = 'choco'}) {
    // This triggers an update in the UI when using GetX
    _currentCategory = newCategory;
    print("$_currentCategory   is current");

    update();
  }

  // // Function to add a snack to a specific category
  // void addSnackToCategory(String category, Snack snack) {
  //   if (snacksData.containsKey(category)) {
  //     // If category exists, add the snack to the existing list
  //     snacksData[category]!.add(snack);
  //   } else {
  //     // If category doesn't exist, create a new entry with the snack
  //     snacksData[category] = [snack];
  //   }
  //   update(); // This triggers an update in the UI when using GetX
  // }
}
