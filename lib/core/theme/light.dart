import 'package:flutter/material.dart';

/// Application theme configuration
class AppTheme {
  static const Color _primaryColor = Color.fromARGB(255, 255, 0, 38);
  static const Color _secondaryColor = Color(0xFF1980cc);
  static const Color _errorColor = Color.fromARGB(255, 255, 2, 40);
  static const Color _surfaceColor = Color(0xFFF5F5F5);

  /// Light theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _primaryColor,
        secondary: _secondaryColor,
        surface: _surfaceColor,
        error: _errorColor,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 1,
      ),
    );
  }
}
