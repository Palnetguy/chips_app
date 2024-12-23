
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background with curved sides
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 
                     MediaQuery.of(context).size.height),
            painter: CurvedSidePainter(),
          ),

          // Main content
          Column(
            children: [
              const SizedBox(height: 60),
              // Product image
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Image.asset(
                    'assets/images/dang.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Quantity and price section
              Container(
                height: 200,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    // Left +
                    Positioned(
                      left: 0,
                      top: 60,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.add, size: 30),
                        ),
                      ),
                    ),

                    // Right -
                    Positioned(
                      right: 0,
                      top: 60,
                      child: GestureDetector(
                        onTap: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.remove, size: 30),
                        ),
                      ),
                    ),

                    // Center quantity
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            quantity.toString().padLeft(2, '0'),
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFE082),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Text(
                              '\$06.00',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom painter for curved sides
class CurvedSidePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[100]!
      ..style = PaintingStyle.fill;

    final leftPath = Path()
      ..moveTo(0, size.height * 0.3)
      ..quadraticBezierTo(
        60, size.height * 0.5,
        0, size.height * 0.7,
      );

    final rightPath = Path()
      ..moveTo(size.width, size.height * 0.3)
      ..quadraticBezierTo(
        size.width - 60, size.height * 0.5,
        size.width, size.height * 0.7,
      );

    canvas.drawPath(leftPath, paint);
    canvas.drawPath(rightPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Custom clipper for the bottom curved section
class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height - 60)
      ..quadraticBezierTo(
        size.width / 2, size.height,
        size.width, size.height - 60,
      )
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}


/*************  ✨ Codeium Command ⭐  *************/
/******  74ecab78-3520-4627-b950-651f870cb7a6  *******/