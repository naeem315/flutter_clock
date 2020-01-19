import 'package:flutter/material.dart';
import 'package:analog_clock/constants/constant.dart';

class ClockSettingsView extends StatelessWidget {
  final String location;
  final String temperature;
  final String weather;
  final String temperatureUnit;
  final isLightTheme;

  const ClockSettingsView({
    Key key,
    @required this.location,
    @required this.temperature,
    @required this.weather,
    @required this.temperatureUnit,
    @required this.isLightTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final decideTemperatureUnit = temperatureUnit.startsWith("C")
        ? String.fromCharCodes(Runes('\u{2103}'))
        : String.fromCharCodes(Runes('\u{2109}'));

    final highLowTemperatureValue = temperature.length > 0
        ? "$temperature$decideTemperatureUnit "
            "(${double.parse(temperature) - 3} - ${double.parse(temperature) + 4} "
            "$decideTemperatureUnit)"
        : "0$decideTemperatureUnit "
            "(0 - ${0 + 4} "
            "$decideTemperatureUnit)";

    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment(-0.9, -0.7),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.location_on,
                size: 18,
                color: isLightTheme
                    ? ThemeColors.lightPrimary
                    : ThemeColors.darkPrimary,
              ),
              SizedBox(
                width: 4.0,
              ),
              Text(
                location,
                style: TextStyle(
                  color: isLightTheme
                      ? ThemeColors.lightPrimary
                      : ThemeColors.darkPrimary,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment(-0.95, 0.8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                weather,
                style: TextStyle(
                  color: isLightTheme
                      ? ThemeColors.lightPrimary
                      : ThemeColors.darkPrimary,
                  fontSize: 18.0,
                ),
              ),
              Text(
                highLowTemperatureValue,
                style: TextStyle(
                  color: isLightTheme
                      ? ThemeColors.lightPrimary
                      : ThemeColors.darkPrimary,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
