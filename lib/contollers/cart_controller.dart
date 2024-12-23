import 'package:chips_app/modules/snacks.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final List<Snack> _cartData = <Snack>[
    // Snack(
    //   title: "Choco Bar",
    //   type: "choco",
    //   price: 2.50,
    //   backgroundColor: "FF5733",
    //   image: "assets/images/choco_bar.png",
    //   subtitle: "Delicious", // Added a sample subtitle
    // ),
    // Snack(
    //   title: "Choco Bar",
    //   type: "choco",
    //   price: 2.50,
    //   backgroundColor: "FF5733",
    //   image: "assets/images/choco_bar.png",
    //   subtitle: "Delicious", // Added a sample subtitle
    // ),
    // Snack(
    //   title: "Choco Bar",
    //   type: "choco",
    //   price: 2.50,
    //   backgroundColor: "FF5733",
    //   image: "assets/images/choco_bar.png",
    //   subtitle: "Delicious", // Added a sample subtitle
    // ),
    // Snack(
    //   title: "Choco Bar",
    //   type: "choco",
    //   price: 2.50,
    //   backgroundColor: "FF5733",
    //   image: "assets/images/choco_bar.png",
    //   subtitle: "Delicious", // Added a sample subtitle
    // ),
  ]; // Observable cart list

  // Getter to access cart data
  List<Snack> get cartData => _cartData;

  // Function to add an item to the cart using named parameters
  void addToCart({
    required String id,
    required String title,
    required String subtitle, // Added subtitle parameter
    required String type,
    required double price,
    required String backgroundColor,
    required String image,
  }) {
    // Check if the snack is already in the cart by title

    _cartData.add(Snack(
      id: id,
      title: title,
      subtitle: subtitle, // Added subtitle to Snack constructor
      type: type,
      price: price,
      backgroundColor: backgroundColor,
      image: image,
    ));
    update(); // Notify listeners about the change
    print(_cartData);
  }

  // Optional: Function to remove an item from the cart
  void removeFromCart(String title) {
    _cartData.removeWhere((item) => item.title == title);
    update(); // Notify listeners about the change
  }
}
