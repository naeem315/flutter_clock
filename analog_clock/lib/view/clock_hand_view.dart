import 'package:flutter/material.dart';
import 'package:analog_clock/constants/constant.dart';
import 'package:analog_clock/view/clock_hand_clipper.dart';

class ClockHandView extends StatelessWidget {
  final HAND_TYPE type;
  final double handSizeValue;
  final double handWidth;
  final double handAngle;
  final Color handColor;

  const ClockHandView(
      {Key key,
      @required this.type,
      @required this.handSizeValue,
      @required this.handWidth,
      @required this.handAngle,
      @required this.handColor})
      : assert(type != null),
        assert(
            handSizeValue != null && handSizeValue >= 1 && handSizeValue <= 10),
        assert(handWidth != null),
        assert(handAngle != null),
        assert(handColor != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: handAngle,
      child: Align(
        alignment: Alignment.topCenter,
        child: ClipPath(
          clipBehavior: Clip.antiAlias,
          clipper: ClockHandClipper(
            handSize: handSizeValue,
            handType: type,
          ),
          child: Container(
            width: handWidth,
            color: handColor,
          ),
        ),
      ),
    );
  }
}
