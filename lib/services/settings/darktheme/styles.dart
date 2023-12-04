import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      appBarTheme: isDarkTheme
          ? const AppBarTheme(
              color: Colors.transparent,
              elevation: 0,
              titleTextStyle: TextStyle(color: Colors.white),
              actionsIconTheme: IconThemeData(
                color: Colors.white,
              ),
            )
          : const AppBarTheme(
              color: Colors.transparent,
              elevation: 0,
              titleTextStyle: TextStyle(color: Colors.black),
              actionsIconTheme: IconThemeData(
                color: Colors.black,
              ),
            ),
      colorScheme: isDarkTheme
          ? const ColorScheme.dark(
              background: Colors.black,
              primary: Colors.white,
              onBackground: Color(0xff161616),
            )
          : const ColorScheme.light(
              onBackground: Colors.white,
              background: Colors.white,
              primary: Colors.black,
            ),
    );
  }
}
