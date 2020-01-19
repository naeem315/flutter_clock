import 'package:flutter/material.dart';
import 'package:analog_clock/constants/constant.dart';

class ClockTicks extends StatelessWidget {
  final isLightTheme;

  const ClockTicks({Key key, @required this.isLightTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> clockTicks = [];
    double hourAngleValue = ClockHandAngles.radiansPerHour;
    double minuteAngleValue = ClockHandAngles.radiansPerTick;

    for (double i = 1; i <= 60; i++) {
      clockTicks.add(
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Transform.rotate(
            angle: minuteAngleValue,
            child: Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    3.0,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  color: Color.fromARGB(255, 178, 178, 178),
                  width: 2.5,
                  height: 7,
                ),
              ),
            ),
          ),
        ),
      );
      minuteAngleValue += ClockHandAngles.radiansPerTick;
    }

    for (double i = 1; i <= 12; i++) {
      clockTicks.add(
        Transform.rotate(
          angle: hourAngleValue,
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 5,
                  backgroundColor: isLightTheme
                      ? ThemeColors.lightPrimary
                      : ThemeColors.darkPrimary,
                ),
                SizedBox(
                  height: 1.0,
                ),
                Transform.rotate(
                  angle: -hourAngleValue,
                  child: Container(
                    width: 35.0,
                    height: 30.0,
                    alignment: Alignment.center,
                    child: Text(
                      i.toInt().toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isLightTheme
                            ? ThemeColors.lightPrimary
                            : ThemeColors.darkPrimary,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      hourAngleValue += ClockHandAngles.radiansPerHour;
    }

    return Stack(
      overflow: Overflow.visible,
      children: clockTicks,
    );
  }
}
