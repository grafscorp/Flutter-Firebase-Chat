// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class FluttterMidnightNeonTheme {
  FluttterMidnightNeonTheme._();

  // If you want to modify both themes at once, modify the colors below.

  static const Color _primaryColor = Color(0xFF6C64BC);
  static const Color _primaryInverseColor = Color(0xFF3C457B);
  static const Color _onSurfaceColor = Color(0xFF8FEF7C);
  static const Color _onSurfaceVariant = Color(0xFF0DFFE7);
  static const Color _onPrimaryColor = Color(0xFFFF7903);
  static const Color _surfaceColor = Color(0xFF490A6B);
  static const Color _backgroundColor = Color.fromARGB(255, 135, 93, 209);
  static const Color _onSecondaryColor = Color.fromARGB(255, 138, 44, 210);
  static const Color _onBackgroundColor = Color.fromARGB(255, 130, 92, 206);
  static const Color _secondaryColor = Color(0xFF05376C);
  static const Color _primaryContainer = Color(0xFF383446);
  static const Color _errorColor = Color(0xFFC1FF05);
  static const Color _onErrorColor = Color(0xFF354157);

  // If you want to modify the light theme only, modify the colors below.

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    //buttonTheme: ButtonThemeData(buttonColor: Colors.amber),
    appBarTheme: AppBarTheme(color: _surfaceColor, scrolledUnderElevation: 0),
    bottomAppBarTheme: BottomAppBarTheme(color: _backgroundColor),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(backgroundColor: _backgroundColor),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: FluttterMidnightNeonTheme._primaryColor,
      background: FluttterMidnightNeonTheme._backgroundColor,
      primary: FluttterMidnightNeonTheme._primaryColor,
      secondary: FluttterMidnightNeonTheme._secondaryColor,
      inversePrimary: FluttterMidnightNeonTheme._primaryInverseColor,
      onSurface: FluttterMidnightNeonTheme._onSurfaceColor,
      surface: FluttterMidnightNeonTheme._surfaceColor,
      onSurfaceVariant: FluttterMidnightNeonTheme._onSurfaceVariant,
      onPrimary: FluttterMidnightNeonTheme._onPrimaryColor,
      onSecondary: FluttterMidnightNeonTheme._onSecondaryColor,
      onBackground: FluttterMidnightNeonTheme._onBackgroundColor,
      primaryContainer: FluttterMidnightNeonTheme._primaryContainer,
      error: FluttterMidnightNeonTheme._errorColor,
      onError: FluttterMidnightNeonTheme._onErrorColor,
    ),
  );

  // If you want to modify the dark theme only, modify the colors below.

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(color: _surfaceColor, scrolledUnderElevation: 0),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: FluttterMidnightNeonTheme._primaryColor,
      background: FluttterMidnightNeonTheme._backgroundColor,
      primary: FluttterMidnightNeonTheme._primaryColor,
      secondary: FluttterMidnightNeonTheme._secondaryColor,
      inversePrimary: FluttterMidnightNeonTheme._primaryInverseColor,
      onSurface: FluttterMidnightNeonTheme._onSurfaceColor,
      surface: FluttterMidnightNeonTheme._surfaceColor,
      onSurfaceVariant: FluttterMidnightNeonTheme._onSurfaceVariant,
      onPrimary: FluttterMidnightNeonTheme._onPrimaryColor,
      onSecondary: FluttterMidnightNeonTheme._onSecondaryColor,
      onBackground: FluttterMidnightNeonTheme._onBackgroundColor,
      primaryContainer: FluttterMidnightNeonTheme._primaryContainer,
      error: FluttterMidnightNeonTheme._errorColor,
      onError: FluttterMidnightNeonTheme._onErrorColor,
    ),
  );
}

// A custom theme by Ivan Robayo | Check out FlutterCustomThemesVol1 for more.
// GitHub: @navirobayo
