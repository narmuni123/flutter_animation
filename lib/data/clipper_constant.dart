import 'package:flutter/material.dart';
import 'dart:math' show pi, cos, sin;
import 'dart:math' as math;

// Chained Animation Project ----> Start

enum CircleSide {
  left,
  right,
}

extension ToPath on CircleSide {
  Path toPath(Size size) {
    final path = Path();

    late Offset offset;
    late bool clockwise;

    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockwise = false;
        break;
      case CircleSide.right:
        offset = Offset(0, size.height);
        clockwise = true;
        break;
    }
    path.arcToPoint(
      offset,
      radius: Radius.elliptical(size.width / 2, size.height / 2),
      clockwise: clockwise,
    );

    path.close();
    return path;
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  final CircleSide side;

  const HalfCircleClipper({
    required this.side,
  });

  @override
  Path getClip(Size size) => side.toPath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

///// >>>>>>>>>>>>>> ENDS >>>>>>>>>>>>>>.

// Tween Animation Builder Project. ------>>>>> Start

/*
Understanding -
eg - 0xFFFFFFFF
First 2 FF -> ALFA and in this fashion RED, GREEN and BLUE
A R G B = 32 bits
A = Alpha (0 - 255) 8 bits (we can say Visibility of color)
R = Red (0 - 255) 8 bits
G = Green (0 - 255) 8 bits
B = Blue (0 - 255) 8 bits

255 == FF
 */

class CircleClipper extends CustomClipper<Path> {
  const CircleClipper();

  @override
  Path getClip(Size size) {
    var path = Path();

    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );

    path.addOval(
      rect,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

// return a random color

Color getRandomColor() => Color(
      0xFF000000 + math.Random().nextInt(0x00FFFFFF),
    );

// Custom Paint Folder -> custom_shapes_animation ----->>>> start

class Polygon extends CustomPainter {
  final int sides;

  Polygon({required this.sides});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    final angle = (2 * pi) / sides;
    final angles = List.generate(sides, (index) => index * angle);
    final radius = size.width / 2;

    /*
    x = center.x + radius * cos(angle)
    y = center.y + radius * sin(angle)
     */
    path.moveTo(
      center.dx + radius * cos(0),
      center.dy + radius * sin(0),
    );

    for (final angle in angles) {
      path.lineTo(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate is Polygon && oldDelegate.sides != sides;
}
