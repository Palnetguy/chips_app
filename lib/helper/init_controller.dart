import 'package:get/get.dart';

import '../contollers/home_screen_controller.dart';

class InitControllers extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
  }
}
