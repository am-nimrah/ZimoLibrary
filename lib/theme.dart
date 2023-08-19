import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider with ChangeNotifier {
  late ThemeData _themeData;
  bool _isDarkMode = false; // Initialize with light mode by default

  ThemeProvider() {
    _themeData = _isDarkMode ? darkTheme : lightTheme;
  }

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _themeData = _isDarkMode ? darkTheme : lightTheme;
    notifyListeners();
  }

  void setDarkTheme() {
    _themeData = darkTheme;
    _isDarkMode = true;
    notifyListeners();
  }

  void setLightTheme() {
    _themeData = lightTheme;
    _isDarkMode = false;
    notifyListeners();
  }

  static ThemeProvider controllerOf(BuildContext context) {
    return Provider.of<ThemeProvider>(context, listen: false);
  }

  ThemeData get themeData => _themeData;
}

final lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.grey,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    unselectedIconTheme: IconThemeData(color: Colors.black),
    selectedIconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.white,
  ),
);

final darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Colors.grey[800],
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.grey,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    unselectedIconTheme: IconThemeData(color: Colors.white), // Unselected icon color for dark theme
    selectedIconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Colors.white,
  ),
);
