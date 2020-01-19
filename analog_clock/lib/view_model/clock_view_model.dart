import 'dart:async';

import 'package:flutter/material.dart';
import 'package:analog_clock/model/clock_model.dart';
import 'package:analog_clock/constants/constant.dart';
import 'package:analog_clock/view/clock_hand_view.dart';
import 'package:analog_clock/view/clock_view.dart';

class ClockViewModel extends StatelessWidget {
  final ClockModel clockModel;

  const ClockViewModel({
    Key key,
    @required this.clockModel,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return ClockView(
      clockHands: ClockHands(
        clockModel: clockModel,
      ),
    );
  }
}

class ClockHands extends StatefulWidget {
  final ClockModel clockModel;
  final _ClockHandsState _clockHandsState = _ClockHandsState();

  ClockHands({
    Key key,
    @required this.clockModel,
  }) : super(
          key: key,
        );

  void setTheme(bool value) {
    _clockHandsState.isLightTheme = value;
  }

  @override
  _ClockHandsState createState() {
    return _clockHandsState;
  }
}

class _ClockHandsState extends State<ClockHands> {
  DateTime _currentTime;
  Timer _timer;
  bool _isLightTheme;

  @override
  void initState() {
    super.initState();
    if (_isLightTheme == null) {
      _isLightTheme = true;
    }
    _updateTime();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateTime() {
    setState(() {
      _currentTime = DateTime.now();
      widget.clockModel.currentTime = _currentTime;
      _timer = Timer(
        Duration(seconds: 1) - Duration(milliseconds: _currentTime.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        // Hours Hand
        ClockHandView(
            type: HAND_TYPE.HOUR,
            handSizeValue: ClockHandDimensions.hourHandLengthFactor,
            handAngle: widget.clockModel.calculatedHourHandAngle,
            handWidth: ClockHandDimensions.hourHandWidth,
            handColor: _isLightTheme
                ? ThemeColors.lightPrimary
                : ThemeColors.darkPrimary),

        // Minutes Hand
        ClockHandView(
            type: HAND_TYPE.MINUTE,
            handSizeValue: ClockHandDimensions.minuteHandLengthFactor,
            handAngle: widget.clockModel.calculatedMinuteHandAngle,
            handWidth: ClockHandDimensions.minuteHandWidth,
            handColor: _isLightTheme
                ? ThemeColors.lightPrimary
                : ThemeColors.darkPrimary),

        // Seconds Hand
        ClockHandView(
            type: HAND_TYPE.SECOND,
            handSizeValue: ClockHandDimensions.secondsHandLengthFactor,
            handAngle: widget.clockModel.calculatedSecondsHandAngle,
            handWidth: ClockHandDimensions.secondsHandWidth,
            handColor: _isLightTheme
                ? ThemeColors.lightAccent
                : ThemeColors.darkAccent),
      ],
    );
  }

  set isLightTheme(bool value) {
    setState(() {
      _isLightTheme = value;
    });
  }
}
