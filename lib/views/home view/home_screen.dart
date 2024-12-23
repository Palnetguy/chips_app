// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
import 'dart:ui';
// import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chips_app/contollers/home_screen_controller.dart';

import '../../constants/appconstants.dart';
import '../../contollers/cart_controller.dart';
import '../../contollers/cart_view_collectons_controller.dart';
import '../../widgets/bottom_cart_preview.dart';
import '../../widgets/build_header.dart';
import '../test screen/test_screen.dart';

final CartController cartController = Get.put(CartController());
final HomeScreenController homeController = Get.put(HomeScreenController());
final CollectionsController collectorsController =
    Get.put(CollectionsController());
final List<String> _items = List.generate(20, (index) => 'Item $index');

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // GetX controller initialization

    print(collectorsController.currentCategory);

    return Scaffold(
      body: SafeArea(
          child: GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        initState: (_) {},
        builder: (_) {
          return Column(
            children: [
              // appbar
              AppHeader(
                icon: Icons.arrow_back_ios_new_rounded,
                textSpan: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          '${collectorsController.currentCategory.capitalize}\n',
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w700,
                        color: AppConstants.kTextColorPrimary,
                      ),
                    ),
                    TextSpan(
                      text: 'Collections',
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w400,
                        color: AppConstants.kTextColorPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              // row
              Expanded(
                child: Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: _BuildProductGrid(
                        productData: homeController.snacks,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () {
                          // homeController.snacks;
                          // print(
                          //   (homeController.snacks['choco'].length) ~/ 2,
                          // );
                        },
                        child: const BottomCartPreview(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      )),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final String type;
  final Color color;
  final String colorString;
  final String subtitle;
  final String imagePath;
  final VoidCallback onClick;

  const ProductCard({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.type,
    required this.color,
    required this.colorString,
    required this.subtitle,
    required this.imagePath,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 200,
      width: MediaQuery.of(context).size.width / 2,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            right: -20,
            top: 40,
            child: Transform.translate(
              offset: const Offset(.5, -1),
              child: Transform.rotate(
                angle: 0.48, // Adjust this value for different tilt angles
                child: Container(
                  width: 125,
                  height: 171,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 83,
                  ), // Set max width for wrapping
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow
                        .ellipsis, // Optional: Adds ellipsis for overflow
                    maxLines: 2, // Optional: Limits to 2 lines
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    type,
                    style: TextStyle(
                      color: AppConstants.kTextColorPrimary.withOpacity(.5),
                      fontSize: 8,
                    ),
                  ),
                ),
                const Spacer(),
                // Price and Cart Button Row
                ClipRRect(
                  borderRadius: BorderRadius.circular(23),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 2,
                        vertical: 2,
                      ),
                      // color: Colors.red,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(23),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Glass-like price container
                          Row(
                            children: [
                              const SizedBox(
                                width: 17,
                              ),
                              Text(
                                '\$${price.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          // Glass-like cart button
                          GestureDetector(
                            onTap: () {
                              // Add to cart logic here
                              cartController.addToCart(
                                id: id,
                                title: title,
                                subtitle: subtitle,
                                type: type,
                                price: price,
                                backgroundColor: colorString,
                                image: imagePath,
                              );
                              onClick;
                              // homeController.removeSnackById(type, id);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
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
                                size: 13,
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
          // Tilted Image
        ],
      ),
    );
  }
}

class AnimatedListWithDelete extends StatefulWidget {
  final List<String> items;
  final Function(String) onDelete;

  const AnimatedListWithDelete(
      {Key? key, required this.items, required this.onDelete})
      : super(key: key);

  @override
  _AnimatedListWithDeleteState createState() => _AnimatedListWithDeleteState();
}

class _AnimatedListWithDeleteState extends State<AnimatedListWithDelete> {
  late List<String> _items;

  @override
  void initState() {
    super.initState();
    _items = widget.items;
  }

  void _deleteItem(int index) {
    final removedItem = _items[index];
    setState(() {
      _items.removeAt(index);
    });

    // Call the onDelete callback to perform additional operations if needed
    widget.onDelete(removedItem);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return AnimatedListItem(
          item: _items[index],
          onDelete: () => _deleteItem(index),
        );
      },
    );
  }
}

class AnimatedListItem extends StatefulWidget {
  final String item;
  final VoidCallback onDelete;

  const AnimatedListItem({Key? key, required this.item, required this.onDelete})
      : super(key: key);

  @override
  _AnimatedListItemState createState() => _AnimatedListItemState();
}

class _AnimatedListItemState extends State<AnimatedListItem> {
  bool _isDeleted = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isDeleted ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: ListTile(
        title: Text(widget.item),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            setState(() {
              _isDeleted = true;
            });
            // Call the delete operation after the animation
            Future.delayed(const Duration(milliseconds: 300), widget.onDelete);
          },
        ),
      ),
    );
  }
}

// Usage Example
class _BuildProductGrid extends StatelessWidget {
  final dynamic productData;

  const _BuildProductGrid({
    required this.productData,
  });

  @override
  Widget build(BuildContext context) {
    // Ensure snacksData and currentCategory are not null
    // final snacks = collectorsController.snacksData[
    //         collectorsController.currentCategory.toString().toLowerCase()] ??
    //     [];

    dynamic snacks;
    if (collectorsController.currentCategory.toString().toLowerCase() ==
        'all') {
      snacks = (homeController.snacksDataAllList) ?? [];
    } else {
      snacks = collectorsController.snacksData[
              collectorsController.currentCategory.toString().toLowerCase()] ??
          [];
    }
    print(snacks);

    final List products = (collectorsController.snacksData[collectorsController
                .currentCategory
                .toString()
                .toLowerCase()] ??
            [])
        .map((e) => print(e))
        .toList();

    print(products);

    return Row(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              ...snacks.sublist(0, snacks.length ~/ 2).map((e) {
                return ProductCard(
                  id: e.id,
                  colorString: e.backgroundColor,
                  subtitle: e.subtitle,
                  type: e.type,
                  title: e.title,
                  price: e.price,
                  color: AppConstants.hexToColor(e.backgroundColor),
                  imagePath: e.image,
                  onClick: () {},
                );
              }),
            ],
          ),
        ).animate().slideY(
              curve: Curves.easeInOut,
              delay: 530.ms,
              duration: 500.ms,
              begin: 1, // Start from bottom (out of the screen)
              end: 0, // End at the normal position (in the screen)
            ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Transform.translate(
                  offset: const Offset(0, -8),
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppConstants.kcolorBorderGrey,
                      borderRadius: BorderRadius.circular(28.35),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 14,
                                color: AppConstants.kTextColorPrimary,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: snacks.length.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: ' Items',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppConstants.kBackgroundColor,
                            borderRadius: BorderRadius.circular(28.35),
                          ),
                          child: const Icon(Icons.tune),
                        ),
                      ],
                    ),
                  ),
                ).animate().slideX(
                      curve: Curves.easeInOut,
                      // delay: 530.ms,
                      duration: 500.ms,
                      begin: 1,
                      end: 0,
                      // End at the normal position (in the screen)
                    ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      if (snacks.isEmpty)
                        Text(
                          'No snacks available in this category: ${collectorsController.currentCategory.toLowerCase()}',
                        ),
                      ...snacks.sublist(snacks.length ~/ 2).map((e) {
                        return ProductCard(
                          id: e.id,
                          colorString: e.backgroundColor,
                          subtitle: e.subtitle,
                          type: e.type,
                          title: e.title,
                          price: e.price,
                          color: AppConstants.hexToColor(e.backgroundColor),
                          imagePath: e.image,
                          onClick: () {},
                        );
                      }).toList(),
                    ],
                  ),
                ).animate().slideY(
                      curve: Curves.easeInOut,
                      delay: 530.ms + 500.ms,
                      duration: 500.ms,
                      begin: 1, // Start from bottom (out of the screen)
                      end: 0, // End at the normal position (in the screen)
                    ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Build the cart section
Widget _buildCart() {
  return Container(
    margin: const EdgeInsets.all(20),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(30),
    ),
    child: const Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.amber,
          child: Text(
            '1',
            style: TextStyle(color: Colors.black),
          ),
        ),
        SizedBox(width: 12),
        Text(
          'Cart',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          ' • 1 Item',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        Spacer(),
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 15,
        ),
      ],
    ),
  );
}

// Custom clipper for the cart shape
class CartShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final double radius = 30.0;
    final double centerDip = 20.0;

    // Start from top-left
    path.moveTo(0, radius);

    // Top-left corner
    path.quadraticBezierTo(0, 0, radius, 0);

    // Top edge with center dip
    path.lineTo(size.width / 2 - 30, 0);
    path.quadraticBezierTo(size.width / 2, -centerDip, size.width / 2 + 30, 0);

    // Top-right edge
    path.lineTo(size.width - radius, 0);

    // Top-right corner
    path.quadraticBezierTo(size.width, 0, size.width, radius);

    // Right edge
    path.lineTo(size.width, size.height - radius);

    // Bottom-right corner
    path.quadraticBezierTo(
        size.width, size.height, size.width - radius, size.height);

    // Bottom edge
    path.lineTo(radius, size.height);

    // Bottom-left corner
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);

    // Close the path
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// class BottomCartSheet extends StatelessWidget {
//   final int itemCount;
//   final List<String> cartImages;

//   const BottomCartSheet({
//     super.key,
//     required this.itemCount,
//     required this.cartImages,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       child: ClipPath(
//         clipper: CartShapeClipper(),
//         child: Container(
//           height: 80,
//           margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
//           decoration: BoxDecoration(
//             color: Colors.black,
//             borderRadius: BorderRadius.circular(30),
//           ),
//           child: Row(
//             children: [
//               const SizedBox(width: 20),
//               // Item count circle
//               Container(
//                 width: 32,
//                 height: 32,
//                 decoration: const BoxDecoration(
//                   color: Color(0xFFFFE082),
//                   shape: BoxShape.circle,
//                 ),
//                 child: Center(
//                   child: Text(
//                     '$itemCount',
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 12),
//               // Cart text and item count
//               Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Cart',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     '${cartImages.length} Item',
//                     style: const TextStyle(
//                       color: Colors.grey,
//                       fontSize: 14,
//                     ),
//                   ),
//                 ],
//               ),
//               const Spacer(),
//               // Cart item images
//               SizedBox(
//                 height: 40,
//                 child: Stack(
//                   children: [
//                     for (var i = 0; i < cartImages.length; i++)
//                       Positioned(
//                         right: i * 25.0,
//                         child: Container(
//                           width: 40,
//                           height: 40,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.white,
//                             border: Border.all(
//                               color: Colors.white,
//                               width: 2,
//                             ),
//                           ),
//                           child: ClipOval(
//                             child: Image.asset(
//                               cartImages[i],
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//               const SizedBox(width: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }