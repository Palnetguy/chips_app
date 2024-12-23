import 'package:chips_app/constants/appconstants.dart';
import 'package:chips_app/modules/snacks.dart';
import 'package:get/get.dart';

class CollectionsController extends GetxController {
  // Initial snacks data
  Map<String, List<Snack>> snacksData = AppConstants.snacksData;
  Map<String, List<Snack>> snacksDataEach = AppConstants.snacksData;

  String _currentCategory = 'choco';
  double _currentItemIntex = 0;
  // Map<String, List<Snack>> snacksDataEach = AppConstants.snacksData;

  // Get function to fetch the snacks data
  dynamic get snacks => snacksData;
  dynamic get currentItemIntex => _currentItemIntex;
  String get currentCategory => _currentCategory;

  void updatecurrentCategory(
    double index,
  ) {
    _currentItemIntex = index;
    print('Has been reset back to : --- : ->>$_currentItemIntex');

    update();
  }

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
}
