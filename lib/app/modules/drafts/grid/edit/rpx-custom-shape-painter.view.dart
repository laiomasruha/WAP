import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class CustomShapePainter extends CustomPainter {
  List<Map> paths;
  ui.Image image;

  CustomShapePainter({this.paths, this.image});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(image, Offset.zero, Paint());

    if (this.paths.length > 0) {
      for (var i = 0; i < this.paths.length; i++) {
        if (paths[i]["end"] != null) {
          Offset start = paths[i]["start"];
          Offset end = paths[i]["end"];
          int shape = paths[i]["shape"];
          Color color = paths[i]["color"];
          double thick = paths[i]["thick"];

          Paint paint = Paint()
            ..color = color
            ..isAntiAlias = true
            ..style = PaintingStyle.stroke
            ..strokeWidth = thick;

          Paint paintTriangle = Paint()
            ..color = Colors.blue
            ..isAntiAlias = true
            ..style = PaintingStyle.stroke
            ..strokeWidth = thick;

          draw(canvas, shape, start, end, paint, paintTriangle);
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomShapePainter oldDelegate) {
    return oldDelegate.paths.length == this.paths.length;
  }

  void draw(Canvas canvas, int shape, Offset start, Offset end, Paint paint,
      Paint paintTriangle) {
    switch (shape) {
      case 1:
        canvas.drawRect(
          Rect.fromPoints(start, end),
          paint,
        );
        break;
      case 2:
        var radius = (start - end).distance;
        canvas.drawCircle(start, radius, paint);
        break;
    }
  }
}
