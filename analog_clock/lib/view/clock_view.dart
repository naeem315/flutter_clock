import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:analog_clock/view/clock_border.dart';
import 'package:analog_clock/view/clock_ticks.dart';
import 'package:analog_clock/view/clock_settings_view.dart';
import 'package:analog_clock/view_model/clock_view_model.dart';
import '../constants/constant.dart';

class ClockView extends StatefulWidget {
  final ClockHands clockHands;

  const ClockView({Key key, @required this.clockHands}) : super(key: key);

  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  bool _isLightTheme;
  String _location;
  String _temperature;
  String _theme;
  String _weather;
  String _temperatureUnit;

  @override
  void initState() {
    _isLightTheme = true;
    _location = "Pakistan";
    _temperature = "26";
    _theme = "Light Theme";
    _weather = "Cloudy";
    _temperatureUnit = "Celsius";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        backgroundColor: _isLightTheme
            ? ThemeColors.lightBackground
            : ThemeColors.darkBackground,
        endDrawer: ClockDrawer(clockViewState: this),
        body: SafeArea(
          child: Center(
            child: AspectRatio(
              aspectRatio: 5 / 3,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      CustomPaint(
                        size: Size(
                          double.infinity,
                          double.infinity,
                        ),
                        painter: ClockBorder(context, _isLightTheme),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ClockTicks(
                          isLightTheme: _isLightTheme,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          backgroundColor: _isLightTheme
                              ? ThemeColors.lightPrimary
                              : ThemeColors.darkPrimary,
                          radius: 8.0,
                        ),
                      ),
                      ClockSettingsView(
                        location: _location,
                        temperature: _temperature,
                        weather: _weather,
                        temperatureUnit: _temperatureUnit,
                        isLightTheme: _isLightTheme,
                      ),
                      widget.clockHands,
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 6.0,
                          backgroundColor: _isLightTheme
                              ? ThemeColors.lightAccent
                              : ThemeColors.darkAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  set location(String value) {
    setState(() {
      _location = value;
    });
  }

  set temperatureUnit(String value) {
    setState(() {
      _temperatureUnit = value;
    });
  }

  set weather(String value) {
    setState(() {
      _weather = value;
    });
  }

  set theme(String value) {
    setState(() {
      _theme = value;
    });
  }

  set temperature(String value) {
    setState(() {
      _temperature = value;
    });
  }

  bool get isLightTheme {
    return _isLightTheme;
  }

  set isLightTheme(bool value) {
    setState(() {
      _isLightTheme = value;
      widget.clockHands.setTheme(_isLightTheme);
    });
  }
}

class TextFieldAccentColor extends StatelessWidget {
  const TextFieldAccentColor({Key key, this.color, this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(
        accentColor: color,
        brightness: Brightness.dark,
      ),
    );
  }
}

class ClockDrawer extends StatefulWidget {
  final _ClockViewState clockViewState;

  const ClockDrawer({Key key, @required this.clockViewState}) : super(key: key);

  @override
  _ClockDrawerState createState() => _ClockDrawerState();
}

class _ClockDrawerState extends State<ClockDrawer> {
  List _themes = ["Light Theme", "Dark Theme"];
  List _weathers = [
    "Cloudy",
    "Foggy",
    "Rainy",
    "Snowy",
    "Sunny",
    "Thunderstorm",
    "Windy"
  ];
  List _temperatureUnits = ["Celsius", "Fahrenheit"];

  List<DropdownMenuItem<String>> _themeMenuItems;
  List<DropdownMenuItem<String>> _weatherMenuItems;
  List<DropdownMenuItem<String>> _temperatureUnitMenuItems;

  List<DropdownMenuItem<String>> _getThemeMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String theme in _themes) {
      items.add(
        DropdownMenuItem(
          value: theme,
          child: Text(
            theme,
            style: TextStyle(
              color: widget.clockViewState._isLightTheme
                  ? ThemeColors.lightPrimary
                  : ThemeColors.darkPrimary,
            ),
          ),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<String>> _getWeatherMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String weather in _weathers) {
      items.add(
        new DropdownMenuItem(
          value: weather,
          child: Text(
            weather,
            style: TextStyle(
              color: widget.clockViewState._isLightTheme
                  ? ThemeColors.lightPrimary
                  : ThemeColors.darkPrimary,
            ),
          ),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<String>> _getTemperatureUnitMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String unit in _temperatureUnits) {
      items.add(
        DropdownMenuItem(
          value: unit,
          child: Text(
            unit,
            style: TextStyle(
              color: widget.clockViewState._isLightTheme
                  ? ThemeColors.lightPrimary
                  : ThemeColors.darkPrimary,
            ),
          ),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    _themeMenuItems = _getThemeMenuItems();
    _weatherMenuItems = _getWeatherMenuItems();
    _temperatureUnitMenuItems = _getTemperatureUnitMenuItems();

    return Drawer(
      elevation: 0.0,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: widget.clockViewState._isLightTheme
              ? ThemeColors.lightBackground
              : Colors.grey,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 30.0, bottom: 30.0, right: 8.0, left: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextFieldAccentColor(
                    color: widget.clockViewState._isLightTheme
                        ? ThemeColors.lightAccent
                        : ThemeColors.darkPrimary,
                    child: TextField(
                      onChanged: (value) {
                        widget.clockViewState.location = value;
                      },
                      cursorColor: widget.clockViewState._isLightTheme
                          ? ThemeColors.lightAccent
                          : ThemeColors.darkPrimary,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Location",
                      ),
                      style: TextStyle(
                        fontSize: 16.0,
                        color: widget.clockViewState._isLightTheme
                            ? ThemeColors.lightAccent
                            : ThemeColors.darkPrimary,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextFieldAccentColor(
                    color: widget.clockViewState._isLightTheme
                        ? ThemeColors.lightAccent
                        : ThemeColors.darkPrimary,
                    child: TextField(
                      onChanged: (value) {
                        widget.clockViewState.temperature = value;
                      },
                      maxLength: 3,
                      cursorColor: widget.clockViewState._isLightTheme
                          ? ThemeColors.lightAccent
                          : ThemeColors.darkPrimary,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Temperature",
                      ),
                      style: TextStyle(
                        fontSize: 16.0,
                        color: widget.clockViewState._isLightTheme
                            ? ThemeColors.lightAccent
                            : ThemeColors.darkPrimary,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: DropdownButton(
                    value: widget.clockViewState._theme,
                    items: _themeMenuItems,
                    onChanged: _themeChanged,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: DropdownButton(
                    value: widget.clockViewState._weather,
                    items: _weatherMenuItems,
                    onChanged: _weatherChanged,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: DropdownButton(
                    value: widget.clockViewState._temperatureUnit,
                    items: _temperatureUnitMenuItems,
                    onChanged: _temperatureUnitChanged,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _themeChanged(String selectedTheme) {
    setState(() {
      if (widget.clockViewState._theme != selectedTheme) {
        widget.clockViewState.theme = selectedTheme;
        widget.clockViewState.isLightTheme =
            !widget.clockViewState.isLightTheme;
      }
    });
  }

  void _weatherChanged(String selectedWeather) {
    widget.clockViewState.weather = selectedWeather;
  }

  void _temperatureUnitChanged(String selectedUnit) {
    widget.clockViewState.temperatureUnit = selectedUnit;
    if (widget.clockViewState._temperatureUnit.startsWith("C")) {
      var v1 = double.parse(widget.clockViewState._temperature) - 32;
      var v2 = v1 * 5;
      var v3 = v2 / 9;
      widget.clockViewState.temperature = v3.toString();
    } else {
      var v1 = 9 * double.parse(widget.clockViewState._temperature);
      var v2 = v1 / 5;
      var v3 = v2 + 32;
      widget.clockViewState.temperature = v3.toString();
    }
  }
}
