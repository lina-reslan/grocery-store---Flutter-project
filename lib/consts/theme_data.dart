import 'package:flutter/material.dart';

class Styles{

  static ThemeData themeData(bool isDarkTheme , BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor:
      isDarkTheme ? const Color(0xFF00001d) : const Color(0xFFFFFFFF),
      primaryColor: Colors.blue,
      colorScheme: ThemeData().colorScheme.copyWith(
        secondary:
        isDarkTheme ? const Color(0xFFF8FcFc) : const Color(0xFFF8FDFD),
        brightness:
        isDarkTheme ? Brightness.dark : Brightness.light,
      ),
      cardColor:
      isDarkTheme ? const Color(0XFF0a0d2c) : const Color(0XFFF2FDFD),
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme:
        isDarkTheme? const ColorScheme.dark() : const ColorScheme.light(),
      ),
    );

  }
}