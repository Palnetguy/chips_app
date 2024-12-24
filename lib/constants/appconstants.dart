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
        title: "Good Source",
        subtitle: "Chocolates",
        type: "choco",
        price: 8.00,
        backgroundColor: "#FFE4E6",
        image: "assets/images/good_source.png",
      ),
      Snack(
        id: "2",
        title: "Unreal Muffins",
        subtitle: "Chocolates",
        type: "choco",
        price: 5.00,
        backgroundColor: "#F7F7A6",
        image: "assets/images/unreal_muffins.png",
      ),
      Snack(
        id: "3",
        title: "Perfect Snacks",
        subtitle: "Chocolates",
        type: "choco",
        price: 8.00,
        backgroundColor: "#F3E8FF",
        image: "assets/images/perfect_snacks.png",
      ),
    ],
    'chips': [
      Snack(
        id: "4",
        title: "Smiths Chips",
        subtitle: "Chips",
        type: "chips",
        price: 7.00,
        backgroundColor: "#FFF7ED",
        image: "assets/images/smiths_chips.png",
      ),
      Snack(
        id: "5",
        title: "Coconut Chips",
        subtitle: "Chips",
        type: "chips",
        price: 6.00,
        backgroundColor: "#F0FDF4",
        image: "assets/images/coconut_chips.png",
      ),
      Snack(
        id: "6",
        title: "Dark Russet",
        subtitle: "Chips",
        type: "chips",
        price: 8.00,
        backgroundColor: "#F5E6E6",
        image: "assets/images/dark_russet.png",
      ),
      Snack(
        id: "7",
        title: "Twister Chips",
        subtitle: "Chips",
        type: "chips",
        price: 6.00,
        backgroundColor: "#FFE4E1",
        image: "assets/images/twister_chips.png",
      ),
      Snack(
        id: "8",
        title: "Regular Nature",
        subtitle: "Chips",
        type: "chips",
        price: 6.00,
        backgroundColor: "#EFF6FF",
        image: "assets/images/regular_nature.png",
      ),
      Snack(
        id: "9",
        title: "Deep River",
        subtitle: "Chips",
        type: "chips",
        price: 7.00,
        backgroundColor: "#F3E8FF",
        image: "assets/images/deep_river.png",
      ),
    ],
    'candy': [
      // empty
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
