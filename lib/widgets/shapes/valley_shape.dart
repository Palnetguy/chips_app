import 'package:flutter/material.dart';

class ValleyShape extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Color color;
  final double? radius;
  const ValleyShape({
    super.key,
    required this.child,
    required this.padding,
    required this.color,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _myCustomClipper(),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius ?? 100 / 2),
            topRight: Radius.circular(radius ?? 100 / 2),
          ),
        ),
        width: double.infinity,
        height: 126,
        // width: 88,
        // height: 210,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}

class _myCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width * 0.2729400, size.height * -0.0014800,
        size.width * 0.3236900, size.height * -0.0014800);
    path.cubicTo(
        size.width * 0.3449350,
        size.height * 0.0092000,
        size.width * 0.3700250,
        size.height * 0.0709600,
        size.width * 0.4039400,
        size.height * 0.0975000);
    path.cubicTo(
        size.width * 0.4416700,
        size.height * 0.0994600,
        size.width * 0.5283850,
        size.height * 0.1001600,
        size.width * 0.5482950,
        size.height * 0.0975000);
    path.cubicTo(
        size.width * 0.5798350,
        size.height * 0.0792000,
        size.width * 0.5971500,
        size.height * 0.0256000,
        size.width * 0.6235500,
        size.height * 0.0033600);
    path.quadraticBezierTo(size.width * 0.6425300, size.height * 0.0040400,
        size.width * 0.9985000, size.height * 0.0020000);
    path.quadraticBezierTo(size.width * 1.0015000, size.height * 0.7610000,
        size.width * 1.0025000, size.height * 1.0140000);
    path.quadraticBezierTo(size.width * 0.7514588, size.height * 1.0153350,
        size.width * -0.0016650, size.height * 1.0193400);

    // path.moveTo(0, size.height * 0.0020000);
    // path.quadraticBezierTo(size.width * 0.1968750, size.height * 0.1435000,
    //     size.width * 0.5000000, size.height * 0.2440000);
    // path.cubicTo(
    //     size.width * 0.9031250,
    //     size.height * 0.3815000,
    //     size.width * 1.0010417,
    //     size.height * 0.4225000,
    //     size.width * 1.0041667,
    //     size.height * 0.5080000);
    // path.cubicTo(
    //     size.width,
    //     size.height * 0.5790000,
    //     size.width * 0.8822917,
    //     size.height * 0.6350000,
    //     size.width * 0.5000000,
    //     size.height * 0.7560000);
    // path.quadraticBezierTo(size.width * 0.1791667, size.height * 0.8650000,
    //     size.width * -0.0083333, size.height * 1.0020000);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; // Return true if the clipper should reclip on changes
  }
}
