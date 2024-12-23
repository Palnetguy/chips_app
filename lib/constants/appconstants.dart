// lib/constants/app_constants.dart

import 'dart:math';

import 'package:chips_app/modules/snacks.dart';
import 'package:flutter/material.dart';

class AppConstants {
  // Private constructor to prevent instantiation
  AppConstants._();
  // data
  static Map<String, List<Snack>> snacksData = {
    'choco': [
      Snack(
        id: "1",
        title: "Choco Milk",
        subtitle: "Delicious Drink",
        type: "choco",
        price: 3.0,
        backgroundColor: "#C70039",
        image: "assets/images/choco_milk.png",
      ),
      Snack(
        id: "2",
        title: "Choco Mik",
        subtitle: "Smooth Taste",
        type: "choco",
        price: 3.0,
        backgroundColor: "#C70039",
        image: "assets/images/choco_milk.png",
      ),
      Snack(
        id: "3",
        title: "Choco Fudge",
        subtitle: "Rich Chocolate",
        type: "choco",
        price: 3.5,
        backgroundColor: "#C70039",
        image: "assets/images/choco_fudge.png",
      ),
      Snack(
        id: "4",
        title: "Choco Bar",
        subtitle: "Crunchy Delight",
        type: "choco",
        price: 2.5,
        backgroundColor: "#C70039",
        image: "assets/images/choco_bar.png",
      ),
      Snack(
        id: "5",
        title: "Choco Hazelnut",
        subtitle: "Creamy Goodness",
        type: "choco",
        price: 3.2,
        backgroundColor: "#C70039",
        image: "assets/images/choco_hazelnut.png",
      ),
      Snack(
        id: "6",
        title: "Choco Crisp",
        subtitle: "Crispy Delight",
        type: "choco",
        price: 2.8,
        backgroundColor: "#C70039",
        image: "assets/images/choco_crisp.png",
      ),
      Snack(
        id: "7",
        title: "Choco Mousse",
        subtitle: "Velvety Texture",
        type: "choco",
        price: 3.7,
        backgroundColor: "#C70039",
        image: "assets/images/choco_mousse.png",
      ),
    ],
    'chips': [
      Snack(
        id: "8",
        title: "Chips Salted",
        subtitle: "Classic Flavor",
        type: "chips",
        price: 1.0,
        backgroundColor: "#FFC300",
        image: "assets/images/chips_salted.png",
      ),
      Snack(
        id: "9",
        title: "Chips Spicy",
        subtitle: "Fiery Kick",
        type: "chips",
        price: 1.2,
        backgroundColor: "#DAF7A6",
        image: "assets/images/chips_spicy.png",
      ),
      Snack(
        id: "10",
        title: "Chips BBQ",
        subtitle: "Smoky Flavor",
        type: "chips",
        price: 1.5,
        backgroundColor: "#FF5733",
        image: "assets/images/chips_bbq.png",
      ),
      Snack(
        id: "11",
        title: "Chips Cheese",
        subtitle: "Cheddar Goodness",
        type: "chips",
        price: 1.3,
        backgroundColor: "#FFD700",
        image: "assets/images/chips_cheese.png",
      ),
      Snack(
        id: "12",
        title: "Chips Sour Cream",
        subtitle: "Tangy Taste",
        type: "chips",
        price: 1.4,
        backgroundColor: "#D1F0E5",
        image: "assets/images/chips_sour_cream.png",
      ),
      Snack(
        id: "13",
        title: "Chips Onion",
        subtitle: "Bold Flavor",
        type: "chips",
        price: 1.6,
        backgroundColor: "#6A4C00",
        image: "assets/images/chips_onion.png",
      ),
      Snack(
        id: "14",
        title: "Chips Salt & Vinegar",
        subtitle: "Zesty Kick",
        type: "chips",
        price: 1.7,
        backgroundColor: "#A9A9A9",
        image: "assets/images/chips_salt_vinegar.png",
      ),
    ],
    'candy': [
      Snack(
        id: "15",
        title: "Candy Lollipop",
        subtitle: "Sweet Bliss",
        type: "candy",
        price: 0.5,
        backgroundColor: "#FF69B4",
        image: "assets/images/candy_lollipop.png",
      ),
      Snack(
        id: "16",
        title: "Candy Lollipop",
        subtitle: "Fun Treat",
        type: "candy",
        price: 0.5,
        backgroundColor: "#FF69B4",
        image: "assets/images/candy_lollipop.png",
      ),
      Snack(
        id: "17",
        title: "Candy Lollipop",
        subtitle: "Fruit Burst",
        type: "candy",
        price: 0.5,
        backgroundColor: "#FF69B4",
        image: "assets/images/candy_lollipop.png",
      ),
      Snack(
        id: "18",
        title: "Candy Lollipop",
        subtitle: "Colorful Joy",
        type: "candy",
        price: 0.5,
        backgroundColor: "#FF69B4",
        image: "assets/images/candy_lollipop.png",
      ),
      Snack(
        id: "19",
        title: "Candy Lollipop",
        subtitle: "Perfect Pick",
        type: "candy",
        price: 0.5,
        backgroundColor: "#FF69B4",
        image: "assets/images/candy_lollipop.png",
      ),
      Snack(
        id: "20",
        title: "Candy Lollipop",
        subtitle: "Fun Flavor",
        type: "candy",
        price: 0.5,
        backgroundColor: "#FF69B4",
        image: "assets/images/candy_lollipop.png",
      ),
      Snack(
        id: "21",
        title: "Candy Lollipop",
        subtitle: "Tasty Treat",
        type: "candy",
        price: 0.5,
        backgroundColor: "#FF69B4",
        image: "assets/images/candy_lollipop.png",
      ),
    ],
  };

  static double sumList(List<double> numbers) {
    return numbers.fold(0, (previousValue, element) => previousValue + element);
  }

  /// A custom function to randomize a list.
  static List<T> randomizeList<T>(List<T> list) {
    var random = Random();
    var randomizedList = List<T>.from(
        list); // Create a copy of the list to avoid modifying the original
    for (int i = randomizedList.length - 1; i > 0; i--) {
      int j = random.nextInt(i + 1); // Get a random index between 0 and i
      // Swap elements at i and j
      var temp = randomizedList[i];
      randomizedList[i] = randomizedList[j];
      randomizedList[j] = temp;
    }
    return randomizedList;
  }

  static Color hexToColor(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");

    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }

    return Color(int.parse(hexColor, radix: 16));
  }

  // Colors
  static const Color kPrimaryColor = Color(0xFF000000);
  static const Color kSecondaryColor = Color(0xFFFFE082);
  static const Color kSecondaryColor2 = Color(0xFFFFEC89);
  static const Color kBackgroundColor = Colors.white;
  static const Color kTextColorPrimary = Colors.black;
  static const Color kTextColorSecondary = Colors.black54;
  static const Color kBlackBorder = Color(0xFF1A1A1A);
  static const Color kTextColorLight = Colors.white;
  static const Color kTextColorGrey = Color(0xFF9E9E9E);
  static Color kcolorBorderGrey = Color.fromARGB(83, 158, 158, 158);
  static Color kTextColorBorderGrey = Color(0xFF9E9E9E).withOpacity(1);
  // static const Color kTextColorBorderGrey = Color.fromARGB(255, 243, 243, 243);
  static const Color kCatIconColor = Color(0xFFFFEC89);
  // static const Color kCatIconColor = Color(0xFFFFEC89);

  // Product Card Colors
  static final Map<String, Color> kProductColors = {
    'yellow': const Color(0xFFFFF8E1),
    'purple': const Color(0xFFF3E5F5),
    'pink': const Color(0xFFFCE4EC),
    'green': const Color(0xFFE8F5E9),
    'blue': const Color(0xFFE3F2FD),
    'brown': const Color(0xFFEFEBE9),
  };

  // Text Styles
  static const TextStyle kHeadingLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: 'SF Pro Display',
  );

  static const TextStyle kHeadingMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: 'SF Pro Display',
  );

  static const TextStyle kHeadingSmall = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: 'SF Pro Display',
  );

  static const TextStyle kBodyLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: 'SF Pro Display',
  );

  static const TextStyle kBodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: 'SF Pro Display',
  );

  static const TextStyle kBodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: 'SF Pro Display',
  );

  static const TextStyle kLabelMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'SF Pro Display',
  );

  // Spacing
  static const double kSpacingXSmall = 4.0;
  static const double kSpacingSmall = 8.0;
  static const double kSpacingMedium = 16.0;
  static const double kSpacingLarge = 20.0;
  static const double kSpacingXLarge = 32.0;

  // Border Radius
  static const double kRadiusSmall = 12.0;
  static const double kRadiusMedium = 20.0;
  static const double kRadiusLarge = 30.0;
  static const double kRadiusCircular = 999.0;

  // Product Card
  static const double kProductCardHeight = 200.0;
  static const double kProductImageSize = 120.0;
  static const double kProductImageTopOffset = 40.0;
  static const double kProductImageRightOffset = -20.0;

  // Cart
  static const double kCartItemSize = 60.0;
  static const double kCartIconSize = 20.0;
  static const double kCartOverlayHeight = 80.0;

  // Category Chips
  static const double kChipIconSize = 16.0;
  static const double kChipSpacing = 4.0;
  static const EdgeInsets kChipPadding = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 12.0,
  );

  // Icons
  static const double kIconSizeSmall = 16.0;
  static const double kIconSizeMedium = 24.0;
  static const double kIconSizeLarge = 32.0;

  // Button
  static const double kButtonHeight = 60.0;
  static const double kButtonRadius = 30.0;

  // Animation
  static const Duration kAnimationDuration = Duration(milliseconds: 300);
  static const Curve kAnimationCurve = Curves.easeInOut;

  // Assets
  static const String kDefaultProductImage = 'assets/images/dang.png';

  // Grid
  static const int kGridColumns = 2;
  static const double kGridAspectRatio = 0.85;
  static const double kGridSpacing = 16.0;

  // Category Icons
  static const Map<String, IconData> kCategoryIcons = {
    'All': Icons.all_inclusive,
    'Choco': Icons.cookie,
    'Chips': Icons.bakery_dining,
    'Candy': Icons.cake,
  };

  // Theme
  static ThemeData get theme => ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: 'SF Pro Display',
        textTheme: const TextTheme(
          headlineLarge: kHeadingLarge,
          headlineMedium: kHeadingMedium,
          headlineSmall: kHeadingSmall,
          bodyLarge: kBodyLarge,
          bodyMedium: kBodyMedium,
          bodySmall: kBodySmall,
          labelMedium: kLabelMedium,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimaryColor,
          primary: kPrimaryColor,
          secondary: kSecondaryColor,
          background: kBackgroundColor,
        ),
      );

  // Cart Summary
  static const cartSummaryDecoration = BoxDecoration(
    color: kSecondaryColor,
    borderRadius: BorderRadius.all(Radius.circular(kRadiusLarge)),
  );

  // Product Card Decoration
  static BoxDecoration productCardDecoration(Color backgroundColor) =>
      BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(kRadiusMedium)),
      );

  // Category Chip Decoration
  static BoxDecoration categoryChipDecoration(bool isSelected) => BoxDecoration(
        color: isSelected ? kPrimaryColor : Colors.grey[100],
        borderRadius: BorderRadius.all(Radius.circular(kRadiusLarge)),
      );
}
