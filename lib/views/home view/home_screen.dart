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
import '../item detail view/item_detail_view.dart';
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

class ProductCard extends StatefulWidget {
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
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isRemoved = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.8,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, -0.5),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animateAndRemove() async {
    setState(() {
      _isRemoved = true;
    });

    await _controller.forward();

    // Remove from data source after animation
    homeController.removeSnackById(widget.type, widget.id);
  }

  Widget _buildCard() {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ItemDetailView(
            name: widget.title,
            subtitle: widget.subtitle,
            type: widget.type,
            imageUrl: widget.imagePath,
            price: widget.price,
            id: widget.id,
            backgroundColor: widget.colorString,
          ),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 200,
        width: MediaQuery.of(context).size.width / 2,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: widget.color,
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
                  angle: 0.48,
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
                      widget.imagePath,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: 83,
                    ),
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
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
                      widget.type,
                      style: TextStyle(
                        color: AppConstants.kTextColorPrimary.withOpacity(.5),
                        fontSize: 8,
                      ),
                    ),
                  ),
                  const Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(23),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 2,
                          vertical: 2,
                        ),
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
                            Row(
                              children: [
                                const SizedBox(width: 17),
                                Text(
                                  '\$${widget.price.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                _animateAndRemove();
                                cartController.addToCart(
                                  id: widget.id,
                                  title: widget.title,
                                  subtitle: widget.subtitle,
                                  type: widget.type,
                                  price: widget.price,
                                  backgroundColor: widget.colorString,
                                  image: widget.imagePath,
                                );
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
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isRemoved) {
      return SizeTransition(
        sizeFactor: Tween<double>(begin: 1, end: 0).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          ),
        ),
        child: SlideTransition(
          position: _slideAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: _buildCard(),
            ),
          ),
        ),
      );
    }

    return _buildCard();
  }
}

// Usage Example
// class _BuildProductGrid extends StatelessWidget {
//   final dynamic productData;

//   const _BuildProductGrid({
//     required this.productData,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // Ensure snacksData and currentCategory are not null
//     // final snacks = collectorsController.snacksData[
//     //         collectorsController.currentCategory.toString().toLowerCase()] ??
//     //     [];

//     dynamic snacks;
//     if (collectorsController.currentCategory.toString().toLowerCase() ==
//         'all') {
//       snacks = (homeController.snacksDataAllList) ?? [];
//     } else {
//       snacks = collectorsController.snacksData[
//               collectorsController.currentCategory.toString().toLowerCase()] ??
//           [];
//     }
//     print(snacks);

//     final List products = (collectorsController.snacksData[collectorsController
//                 .currentCategory
//                 .toString()
//                 .toLowerCase()] ??
//             [])
//         .map((e) => print(e))
//         .toList();

//     print(products);

//     return Row(
//       children: [
//         Expanded(
//           child: ListView(
//             padding: const EdgeInsets.all(8),
//             children: [
//               ...snacks.sublist(0, snacks.length ~/ 2).map((e) {
//                 return ProductCard(
//                   id: e.id,
//                   colorString: e.backgroundColor,
//                   subtitle: e.subtitle,
//                   type: e.type,
//                   title: e.title,
//                   price: e.price,
//                   color: AppConstants.hexToColor(e.backgroundColor),
//                   imagePath: e.image,
//                   onClick: () {},
//                 );
//               }),
//             ],
//           ),
//         ).animate().slideY(
//               curve: Curves.easeInOut,
//               delay: 530.ms,
//               duration: 500.ms,
//               begin: 1, // Start from bottom (out of the screen)
//               end: 0, // End at the normal position (in the screen)
//             ),
//         Expanded(
//           child: Container(
//             padding: const EdgeInsets.all(8),
//             child: Column(
//               children: [
//                 Transform.translate(
//                   offset: const Offset(0, -8),
//                   child: Container(
//                     margin: const EdgeInsets.all(8),
//                     padding: const EdgeInsets.all(4),
//                     decoration: BoxDecoration(
//                       color: AppConstants.kcolorBorderGrey,
//                       borderRadius: BorderRadius.circular(28.35),
//                     ),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: RichText(
//                             textAlign: TextAlign.center,
//                             text: TextSpan(
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: AppConstants.kTextColorPrimary,
//                               ),
//                               children: <TextSpan>[
//                                 TextSpan(
//                                   text: snacks.length.toString(),
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w700,
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: ' Items',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Container(
//                           width: 50,
//                           padding: const EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                             color: AppConstants.kBackgroundColor,
//                             borderRadius: BorderRadius.circular(28.35),
//                           ),
//                           child: const Icon(Icons.tune),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ).animate().slideX(
//                       curve: Curves.easeInOut,
//                       // delay: 530.ms,
//                       duration: 500.ms,
//                       begin: 1,
//                       end: 0,
//                       // End at the normal position (in the screen)
//                     ),
//                 Expanded(
//                   child: ListView(
//                     shrinkWrap: true,
//                     children: [
//                       if (snacks.isEmpty)
//                         Text(
//                           'No snacks available in this category: ${collectorsController.currentCategory.toLowerCase()}',
//                         ),
//                       ...snacks.sublist(snacks.length ~/ 2).map((e) {
//                         return ProductCard(
//                           id: e.id,
//                           colorString: e.backgroundColor,
//                           subtitle: e.subtitle,
//                           type: e.type,
//                           title: e.title,
//                           price: e.price,
//                           color: AppConstants.hexToColor(e.backgroundColor),
//                           imagePath: e.image,
//                           onClick: () {},
//                         );
//                       }).toList(),
//                     ],
//                   ),
//                 ).animate().slideY(
//                       curve: Curves.easeInOut,
//                       delay: 530.ms + 500.ms,
//                       duration: 500.ms,
//                       begin: 1, // Start from bottom (out of the screen)
//                       end: 0, // End at the normal position (in the screen)
//                     ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class _BuildProductGrid extends StatelessWidget {
  final dynamic productData;

  const _BuildProductGrid({
    required this.productData,
  });

  @override
  Widget build(BuildContext context) {
    dynamic snacks;
    if (collectorsController.currentCategory.toString().toLowerCase() ==
        'all') {
      snacks = (homeController.snacksDataAllList) ?? [];
    } else {
      snacks = collectorsController.snacksData[
              collectorsController.currentCategory.toString().toLowerCase()] ??
          [];
    }

    return Row(
      children: [
        Expanded(
          child: AnimatedList(
            padding: const EdgeInsets.all(8),
            initialItemCount: snacks.sublist(0, snacks.length ~/ 2).length,
            itemBuilder: (context, index, animation) {
              final item = snacks.sublist(0, snacks.length ~/ 2)[index];
              return SizeTransition(
                sizeFactor: animation,
                child: ProductCard(
                  id: item.id,
                  colorString: item.backgroundColor,
                  subtitle: item.subtitle,
                  type: item.type,
                  title: item.title,
                  price: item.price,
                  color: AppConstants.hexToColor(item.backgroundColor),
                  imagePath: item.image,
                  onClick: () {},
                ),
              );
            },
          ),
        ).animate().slideY(
              curve: Curves.easeInOut,
              delay: 530.ms,
              duration: 500.ms,
              begin: 1,
              end: 0,
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
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const TextSpan(
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
                      duration: 500.ms,
                      begin: 1,
                      end: 0,
                    ),
                Expanded(
                  child: AnimatedList(
                    shrinkWrap: true,
                    initialItemCount: snacks.sublist(snacks.length ~/ 2).length,
                    itemBuilder: (context, index, animation) {
                      final item = snacks.sublist(snacks.length ~/ 2)[index];
                      return SizeTransition(
                        sizeFactor: animation,
                        child: ProductCard(
                          id: item.id,
                          colorString: item.backgroundColor,
                          subtitle: item.subtitle,
                          type: item.type,
                          title: item.title,
                          price: item.price,
                          color: AppConstants.hexToColor(item.backgroundColor),
                          imagePath: item.image,
                          onClick: () {},
                        ),
                      );
                    },
                  ),
                ).animate().slideY(
                      curve: Curves.easeInOut,
                      delay: 530.ms + 500.ms,
                      duration: 500.ms,
                      begin: 1,
                      end: 0,
                    ),
              ],
            ),
          ),
        ),
      ],
    );
  }
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
