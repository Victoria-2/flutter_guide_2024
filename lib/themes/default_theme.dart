import 'package:flutter/material.dart';

class DefaultTheme {
  static const Color primary = Colors.red;
  static final Color primaryHover = Colors.red.shade600;

  static final ThemeData defaultTheme = ThemeData.light().copyWith(
    primaryColor: Colors.greenAccent,
  );
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.greenAccent,
  );
}
