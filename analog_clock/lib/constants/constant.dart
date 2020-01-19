import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

/// Angles of clock hands according to current time
class ClockHandAngles {
  /// Total distance traveled by a second or a minute hand, each second or minute,
  /// respectively.
  static final radiansPerTick = radians(360 / 60);

  /// Total distance traveled by an hour hand, each hour, in radians.
  static final radiansPerHour = radians(360 / 12);

  /// Total distance traveled by an minute hand in one minute.
  static final minuteHandAngle = radiansPerTick / 60;

  /// Total distance traveled by an hour hand in one hour.
  static final hourHandAngle = radiansPerHour / 3600;
}

/// Dimensions of clock hands
class ClockHandDimensions {
  /// Width of clock hands in pixels
  static final hourHandWidth = 20.0;
  static final minuteHandWidth = 20.0;
  static final secondsHandWidth = 4.5;

  /// Length of clock hands & the values must be 1-10
  static final hourHandLengthFactor = 4.5;
  static final minuteHandLengthFactor = 8.3;
  static final secondsHandLengthFactor = 9.5;
}

/// Theme based colors of Clock
class ThemeColors {
  /// Different Theme Colors
  /// Light Theme Values
  static final lightBackground = Color.fromARGB(255, 244, 208, 208);
  static final lightPrimary = Color.fromARGB(255, 48, 48, 48);
  static final lightAccent = Color.fromARGB(255, 244, 33, 33);

  /// Dark Theme Values
  static final Color darkBackground = Color.fromARGB(255, 48, 48, 48);
  static final Color darkPrimary = Color.fromARGB(255, 190, 211, 102);
  static final Color darkAccent = Color.fromARGB(255, 255, 66, 0);
}

/// Enum for clock hands
enum HAND_TYPE {
  HOUR,
  MINUTE,
  SECOND,
}
