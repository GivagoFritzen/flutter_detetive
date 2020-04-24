import 'package:flutter/material.dart';

class DrawTriangle extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double height, width;

  DrawTriangle(
      {this.strokeColor = Colors.black,
      this.paintingStyle = PaintingStyle.fill,
      this.height,
      this.width})
      : assert(height != null && width != null);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(this.width, this.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x / 2, 0)
      ..lineTo(x, y)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(DrawTriangle oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle;
  }
}
