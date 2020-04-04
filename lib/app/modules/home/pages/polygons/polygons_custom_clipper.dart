import 'package:flutter/material.dart';
import 'dart:math' as math;

class PolygonsCustomClipper extends CustomClipper<Path> {
  int sizes;

  PolygonsCustomClipper(this.sizes);

  @override
  Path getClip(Size size) {
    Path path = Path();
    
    final radius = size.width / 2;
    final radiusAngle = 360 / sizes;

    var angle = 0.0;
    final offsets = <Offset>[];
    while (angle < 360) {
      final radAngle = angle * math.pi / 180;
      final x = (math.sin(radAngle) * radius) + radius;
      final y = (math.cos(radAngle) * radius) + radius;
      offsets.add(Offset(x, y));
      angle += radiusAngle;
    }

    path.addPolygon(
      offsets,
      true,
    );

    return path;
  }

  @override
  bool shouldReclip(PolygonsCustomClipper oldClipper) {
    return oldClipper.sizes != sizes;
  }
}
