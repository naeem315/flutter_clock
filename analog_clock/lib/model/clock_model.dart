import 'package:analog_clock/constants/constant.dart';

class ClockModel {
  double _calculatedHourHandAngle;
  double _calculatedMinuteHandAngle;
  double _calculatedSecondsHandAngle;
  DateTime _currentTime;

  ClockModel(this._currentTime) {
    _calculateTime();
  }

  set currentTime(DateTime value) {
    _currentTime = value;
    _calculateTime();
  }

  void _calculateTime() {
    _calculatedHourHandAngle =
        (ClockHandAngles.radiansPerHour * _currentTime.hour) +
            (ClockHandAngles.hourHandAngle *
                ((_currentTime.minute * 60) + _currentTime.second));
    _calculatedMinuteHandAngle =
        (ClockHandAngles.radiansPerTick * _currentTime.minute) +
            (ClockHandAngles.minuteHandAngle * _currentTime.second);
    _calculatedSecondsHandAngle =
        ClockHandAngles.radiansPerTick * _currentTime.second;
  }

  double get calculatedHourHandAngle => _calculatedHourHandAngle;

  double get calculatedSecondsHandAngle => _calculatedSecondsHandAngle;

  double get calculatedMinuteHandAngle => _calculatedMinuteHandAngle;
}
