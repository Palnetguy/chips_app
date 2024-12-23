// ignore_for_file: public_member_api_docs, sort_constructors_first
// Home screen of the application
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chips_app/contollers/cart_view_collectons_controller.dart';
import 'package:chips_app/contollers/home_screen_controller.dart';
import 'package:chips_app/views/home%20view/home_screen.dart';
import 'package:chips_app/widgets/bottom_cart_preview.dart';

import '../../constants/appconstants.dart';
import '../../widgets/build_header.dart';

final CollectionsController collectorsController =
    Get.put(CollectionsController());
final HomeScreenController homeController = Get.put(HomeScreenController());

class CartCollections extends StatefulWidget {
  const CartCollections({super.key});

  @override
  State<CartCollections> createState() => _CartCollectionsState();
}

// State class for CartCollections
class _CartCollectionsState extends State<CartCollections> {
  int _selectedIndex = 1; // Default selected category index

  // List of snack categories

  final List<String> _categories = ['All', 'Choco', 'Chips', 'Candy'];
  // Icons corresponding to each category
  final List<IconData> _categoryIcons = [
    Icons.all_inclusive,
    Icons.cookie,
    Icons.cookie_outlined,
    Icons.cake,
  ];

  int _selectedCategoryIndex = 2; // Chips selected by default
  final PageController _pageController = PageController();

  int _currentPage = 1;

  final List<_CategoryData> categories = [
    _CategoryData(title: 'All', icon: Icons.all_inclusive),
    _CategoryData(title: 'Choco', icon: Icons.cookie),
    _CategoryData(title: 'Chips', icon: Icons.local_dining),
    _CategoryData(title: 'Candy', icon: Icons.cake),
  ];

  @override
  Widget build(BuildContext context) {
    collectorsController.updateCategory(
        newCategory: _categories[_selectedIndex]);
    // final List<String> itemImages = [
    //   'assets/images/dang.png',
    //   'assets/images/dang.png',
    //   'assets/images/dang.png',
    // ];
    // collectorsController
    //     .snacksData[_categories[_selectedIndex].toString().toLowerCase()]
    //     ?.forEach((e) {
    //   ProductData(
    //     title: e.title,
    //     subtitle: e.type,
    //     price: e.price,
    //     backgroundColor: const Color(0xFFFFF8E1),
    //   );
    // });
    print(collectorsController
        .snacksData[_categories[_selectedIndex].toString().toLowerCase()]);

    List<ProductData> products;
    if (_categories[_selectedIndex].toString().toLowerCase() == 'all') {
      products = (homeController.snacksDataAllList ?? [])
          .map<ProductData>(
            (e) => ProductData(
              id: e.id,
              title: e.title,
              subtitle: e.subtitle,
              price: e.price,
              backgroundColor: AppConstants.hexToColor(e.backgroundColor),
              imagePath: e.image,
              type: e.type,
              colorString: e.backgroundColor,
            ),
          )
          .toList();
    } else {
      products = (collectorsController.snacksData[
                  _categories[_selectedIndex].toString().toLowerCase()] ??
              [])
          .map<ProductData>(
            (e) => ProductData(
              id: e.id,
              title: e.title,
              subtitle: e.subtitle,
              price: e.price,
              backgroundColor: AppConstants.hexToColor(e.backgroundColor),
              imagePath: e.image,
              type: e.type,
              colorString: e.backgroundColor,
            ),
          )
          .toList();
    }
    // final List<ProductData> products = (collectorsController.snacksData[
    //             _categories[_selectedIndex].toString().toLowerCase()] ??
    //         [])
    //     .map<ProductData>(
    //       (e) => ProductData(
    //         title: e.title,
    //         subtitle: e.subtitle,
    //         price: e.price,
    //         backgroundColor: AppConstants.hexToColor(e.backgroundColor),
    //         imagePath: e.image,
    //         type: e.type,
    //         colorString: e.backgroundColor,
    //       ),
    //     )
    //     .toList();

    print(products);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppHeader(
              icon: Icons.menu,
              textSpan: TextSpan(
                children: [
                  TextSpan(
                    text: 'Order From The\nBest Of ',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: AppConstants.kTextColorPrimary,
                    ),
                  ),
                  TextSpan(
                    text: 'Snacks',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: AppConstants.kTextColorPrimary,
                    ),
                  ),
                ],
              ),
            ),
            // Header section
            _buildCategories(), // Category selection
            _buildCollectionHeader(),
            Expanded(
              child: Stack(
                children: [
                  _ChipsList(
                    pageController: _pageController,
                    products: products,
                    currentPage: _currentPage,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: const BottomCartPreview(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build the category selection chips
  Widget _buildCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Row(
            children: List.generate(
                _categories.length,
                (index) =>
                    _buildCategoryChip(index, isAll: index == 0 ? true : false)
                // : _buildCategoryChip(index),
                ),
          ),
        ],
      ),
    );
  }

  // Build a single category chip
  Widget _buildCategoryChip(int index, {bool isAll = false}) {
    final isSelected = _selectedIndex == index;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FilterChip(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(38),
        ),
        side: const BorderSide(
          color: Colors.transparent,
        ),
        label: Row(
          children: [
            isAll
                ? SizedBox()
                : Icon(
                    _categoryIcons[index],
                    size: 15,
                    color:
                        isSelected ? AppConstants.kCatIconColor : Colors.black,
                  ),
            isSelected
                ? SizedBox()
                : (isAll
                    ? Text(
                        _categories[index],
                        style: TextStyle(
                          fontSize: 13,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      )
                    : SizedBox()),
            isSelected
                ? Row(
                    children: [
                      const SizedBox(width: 4),
                      Text(
                        _categories[index],
                        style: TextStyle(
                          fontSize: 13,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
        selected: isSelected,
        onSelected: (bool selected) {
          setState(() {
            _selectedIndex = index;
            // collectorsController.updateSnacks(_categories[_selectedIndex]);
            print('jshsgs');
            print(_categories);
            collectorsController.categoryChanged();
          });
        },
        backgroundColor: AppConstants.kcolorBorderGrey,
        selectedColor: Colors.black,
        checkmarkColor: Colors.transparent,
        showCheckmark: false,
        padding: !isAll
            ? isSelected
                ? const EdgeInsets.symmetric(
                    horizontal: 75 / 4,
                    vertical: 60 / 4,
                  )
                : const EdgeInsets.symmetric(
                    horizontal: 75 / 4,
                    vertical: 75 / 4,
                  )
            : const EdgeInsets.symmetric(
                horizontal: 75 / 4,
                vertical: 60 / 4,
              ),
      ),
    );
  }

  // Build the collection header
  Widget _buildCollectionHeader() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${_categories[_selectedIndex]} ',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: AppConstants.kTextColorPrimary,
                  ),
                ),
                const TextSpan(
                  text: 'Collections',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: AppConstants.kTextColorPrimary,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => HomeScreen());
            },
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}

class _ChipsList extends StatelessWidget {
  const _ChipsList({
    super.key,
    required PageController pageController,
    required this.products,
    required int currentPage,
  })  : _pageController = pageController,
        _currentPage = currentPage;

  final PageController _pageController;
  final List<ProductData> products;
  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return PageTransformerPageView(
      pageController: _pageController,
      itemCount: products.length,
      transformer: _DiagonalFlyTransformer(),
      itemBuilder: (context, index) {
        return _ProductCard(
          product: products[index],
          isActive: _currentPage == index,
        );
      },
    );
  }
}

class _ProductCard extends StatelessWidget {
  final ProductData product;
  final bool isActive;

  const _ProductCard({
    required this.product,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: product.backgroundColor,
      height: 100, // Increased overall height
      margin: EdgeInsets.only(
        left: 35,
        right: 35,
        top: isActive ? 20 : 40,
        bottom: isActive ? 20 : 0,
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          // Main Card
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              height: 370, // Increased card height
              decoration: BoxDecoration(
                color: product.backgroundColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Stack(
                children: [
                  // Product Image with Transform
                  Positioned(
                    right: -40,
                    top: 60,
                    child: Transform.translate(
                      offset: const Offset(.5, -1),
                      child: Transform.rotate(
                        angle: 0.48,
                        child: Container(
                          // width: 280, // Increased image width
                          height: 350, // Increased image height
                          decoration: const BoxDecoration(
                              // borderRadius: BorderRadius.circular(10),
                              ),
                          child: Image.asset(
                            product.imagePath,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24), // Increased padding
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title with constraints
                        Container(
                          constraints: const BoxConstraints(
                            maxWidth: 170, // Increased max width
                          ),
                          child: Text(
                            product.title,
                            style: const TextStyle(
                                fontSize: 36, // Increased font size
                                fontWeight: FontWeight.bold,
                                height: 1),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        const SizedBox(height: 12), // Increased spacing

                        // Category Pill
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            product.type,
                            style: TextStyle(
                              color: Colors.black.withOpacity(.5),
                              fontSize: 14, // Increased font size
                            ),
                          ),
                        ),

                        const Spacer(),

                        // Price and Cart Button with glass effect
                        ClipRRect(
                          borderRadius: BorderRadius.circular(28),
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 2,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(28),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Price
                                  Row(
                                    children: [
                                      const SizedBox(width: 17),
                                      Text(
                                        '\$${product.price.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                          fontSize: 20, // Increased font size
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Cart button
                                  GestureDetector(
                                    onTap: () {
                                      // Add to cart logic here
                                      cartController.addToCart(
                                        id: product.id,
                                        title: product.title,
                                        subtitle: product.subtitle,
                                        type: product.type,
                                        price: product.price,
                                        backgroundColor: product.colorString,
                                        image: product.imagePath,
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(
                                          10), // Increased padding
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.8),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white.withOpacity(0.2),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                        size: 30, // Increased icon size
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryData {
  final String title;
  final IconData icon;
  final bool? isAll;

  _CategoryData({
    required this.title,
    required this.icon,
    this.isAll,
  });
}

class ProductData {
  final String id;
  final String title;
  final String subtitle;
  final String imagePath;
  final String type;
  final String colorString;
  final double price;
  final Color backgroundColor;

  final bool? isAll;

  const ProductData({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.type,
    required this.colorString,
    required this.price,
    required this.backgroundColor,
    this.isAll,
  });
}

// Additional required classes (PageTransformer, TransformInfo, etc.)
typedef PageTransformerBuilder = Widget Function(
  BuildContext context,
  int index,
);

class TransformInfo {
  final double position;
  final BuildContext context;
  final int index;

  TransformInfo({
    required this.position,
    required this.context,
    required this.index,
  });
}

abstract class PageTransformer {
  Widget transform(Widget child, TransformInfo info);
}

class PageTransformerPageView extends StatefulWidget {
  final PageController pageController;
  final PageTransformer transformer;
  final int itemCount;
  final PageTransformerBuilder itemBuilder;
  final double? currentPage;

  const PageTransformerPageView({
    super.key,
    required this.pageController,
    required this.transformer,
    required this.itemCount,
    required this.itemBuilder,
    this.currentPage,
  });

  @override
  State<PageTransformerPageView> createState() =>
      _PageTransformerPageViewState();
}

class _PageTransformerPageViewState extends State<PageTransformerPageView> {
  double? _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.pageController.initialPage.toDouble();
    widget.pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    widget.pageController.removeListener(_onPageChanged);
    super.dispose();
  }

  void _onPageChanged() {
    setState(() {
      _currentPage = widget.pageController.page;
      print(_currentPage); // print curent ndex
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: widget.pageController,
      itemCount: widget.itemCount,
      itemBuilder: (context, index) {
        final position = (_currentPage ?? 0) - index;
        final info = TransformInfo(
          position: position,
          context: context,
          index: index,
        );
        return widget.transformer.transform(
          widget.itemBuilder(context, index),
          info,
        );
      },
    );
  }
}

class _DiagonalFlyTransformer extends PageTransformer {
  @override
  Widget transform(Widget child, TransformInfo info) {
    final position = info.position;
    final width = MediaQuery.of(info.context).size.width;

    // Scale effect
    final scale = 1 - (position.abs() * 0.3).clamp(0.0, 0.3);

    // Rotation angle
    final rotationAngle = position * 0.6;

    // Always translate from/to right side
    final translateX = position < 0 ? width * position.abs() : width * position;

    // Diagonal movement
    final translateY = 100.0 * position.abs();

    final transform = Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..translate(translateX, translateY)
      ..rotateZ(rotationAngle)
      ..scale(scale);

    return Transform(
      transform: transform,
      alignment: Alignment.center,
      child: child,
    );
  }
}

// Data Classes
