import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:analog_clock/model/clock_model.dart';
import 'package:analog_clock/view_model/clock_view_model.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
    );

    return ClockViewModel(
      clockModel: ClockModel(
        DateTime.now(),
      ),
    );
  }
}
