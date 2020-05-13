import 'package:flutter/material.dart';

class DrawTopTriangle extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double height, width;

  DrawTopTriangle(
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
      ..lineTo(0, 0)
      ..lineTo(x / 2, 0)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(DrawTopTriangle oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle;
  }
}

class DrawBottomTriangle extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double height, width;

  DrawBottomTriangle(
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
      ..moveTo(x, 0)
      ..lineTo(x, 0)
      ..lineTo(0, y)
      ..lineTo(x, y);
  }

  @override
  bool shouldRepaint(DrawBottomTriangle oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle;
  }
}
