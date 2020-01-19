import 'package:flutter/material.dart';
import '../constants/constant.dart';

class ClockHandClipper extends CustomClipper<Path> {
  final double handSize;
  final HAND_TYPE handType;

  const ClockHandClipper(
      {Key key, @required this.handSize, @required this.handType})
      : assert(handSize != null && handSize >= 1 && handSize <= 10);

  @override
  Path getClip(Size size) {
    var handSizeCalculated = (10 - handSize) * 10;
    Path path = Path();

    if (handType == HAND_TYPE.SECOND) {
      var tailHeight = 35;
      var upperWidthFactor = size.width / 4;

      path.moveTo(upperWidthFactor, handSizeCalculated);
      path.lineTo(upperWidthFactor, size.height / 2);
      path.lineTo(0, size.height / 2);
      path.lineTo(0, (size.height / 2) + tailHeight);
      path.quadraticBezierTo(size.width / 2, (size.height / 2) + tailHeight + 3,
          size.width, (size.height / 2) + tailHeight);
      path.lineTo(size.width, size.height / 2);
      path.lineTo(size.width - upperWidthFactor, size.height / 2);
      path.lineTo(size.width - upperWidthFactor, handSizeCalculated);
      path.quadraticBezierTo(size.width / 2, handSizeCalculated - 3,
          upperWidthFactor, handSizeCalculated);
      path.close();
    } else {
      var arrowLengthFactor = handType == HAND_TYPE.HOUR ? 37 : 40;
      var arrowCurveXFactor = handType == HAND_TYPE.HOUR ? 15 : 10;
      var arrowCurveYFactor = arrowLengthFactor - 3;
      var lowerWidthFactor = handType == HAND_TYPE.HOUR ? 2.5 : 1.8;

      path.moveTo(size.width / 2, handSizeCalculated);
      path.quadraticBezierTo(
          (size.width / 2) - arrowCurveXFactor,
          handSizeCalculated + arrowCurveYFactor,
          (size.width / 2) - lowerWidthFactor,
          handSizeCalculated + arrowLengthFactor);
      path.lineTo((size.width / 2) - lowerWidthFactor, size.height / 2);
      path.lineTo((size.width / 2) + lowerWidthFactor, size.height / 2);
      path.lineTo((size.width / 2) + lowerWidthFactor,
          handSizeCalculated + arrowLengthFactor);
      path.quadraticBezierTo(
          (size.width / 2) + arrowCurveXFactor,
          handSizeCalculated + arrowCurveYFactor,
          size.width / 2,
          handSizeCalculated);
    }
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) {
    return true;
  }
}
