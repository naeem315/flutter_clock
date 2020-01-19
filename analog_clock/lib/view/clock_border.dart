import 'dart:math';

import 'package:flutter/material.dart';
import 'package:analog_clock/constants/constant.dart';

class ClockBorder extends CustomPainter {
  final BuildContext context;
  final isLightTheme;

  ClockBorder(this.context, this.isLightTheme);

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color =
          isLightTheme ? ThemeColors.lightPrimary : ThemeColors.darkPrimary
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
