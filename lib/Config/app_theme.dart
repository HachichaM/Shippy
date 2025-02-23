import 'package:flutter/material.dart';

class AppTheme {
  // Define a custom MaterialColor if you want a specific swatch,
  // or just use one of the predefined swatches like Colors.blue, Colors.red, etc.
  static const MaterialColor _primaryColorSwatch = Colors.blue;

  static ThemeData get lightTheme {
    return ThemeData(
      // ----------------------------
      // 1) Primary color properties
      // ----------------------------
      // 'primarySwatch' is the main color used for AppBar, FAB, etc.
      primarySwatch: _primaryColorSwatch,

      // 'primaryColor' is the color most prominently displayed in the app (often the AppBar).
      primaryColor: _primaryColorSwatch,

      // Scaffold background color
      scaffoldBackgroundColor: Colors.white,

      // ---------------------------
      // 2) Typography / TextTheme
      // ---------------------------
      textTheme: TextTheme(
        // Large text often used in AppBars (Material 2 naming)
        headlineMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        // Sub-headings
        labelMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
        ),
        // Body text for standard paragraphs
        bodySmall: TextStyle(
          fontSize: 14,
          color: Colors.black87,
        ),
        // Secondary body text or less emphasized text
        bodyMedium: TextStyle(
          fontSize: 16,
          color: Colors.black54,
        ),



      ),

      // --------------------------
      // 3) AppBar & Icon Themes
      // --------------------------
      appBarTheme: AppBarTheme(
        backgroundColor: _primaryColorSwatch,
        // By default, Flutter uses 'headline6' from the textTheme for AppBar title,
        // but we can override it here with a custom style:
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        iconTheme: IconThemeData(color: Colors.blueAccent),
      ),

      // --------------------------------------------
      // 4) ElevatedButton & TextButton Themes
      // --------------------------------------------
      elevatedButtonTheme: ElevatedButtonThemeData(
        // For Flutter 3.0+
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryColorSwatch,
          foregroundColor: Colors.white,
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _primaryColorSwatch, // text color
        ),
      ),

      // -------------------------------
      // 5) FloatingActionButton Theme
      // -------------------------------
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _primaryColorSwatch,
        foregroundColor: Colors.white,
      ),
    );
  }
}
