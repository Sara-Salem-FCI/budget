import 'package:flutter/material.dart';

/// Centralized color palette for the application.
abstract class AppColors {
  /// The primary deep blue color used throughout the app.
  static const Color primary = Color(0xFF053E94);
  static const Color orange = Color(0xFFEF6423);

  static const Color primarySky = Color(0xFF7799CC);
  
  /// Pure white color for backgrounds and text.
  static const Color white = Color(0xFFFFFFFF);
  
  /// Deep blue used for primary buttons and accents.
  static const Color deepBlue = Color(0xFF003E93);
  
  /// A subtle grey for text or borders.
  static const Color grey = Color(0xFF757575);
  
  /// Light grey for inactive dots or dividers.
  static const Color lightGrey = Color(0xFFE0E0E0);

  /// Vibrant sky blue for top wave/gradient.
  static const Color lightBlue = Color(0xFF64B5F6);

  /// Dark background color if needed.
  static const Color background = Color(0xFFF8F9FA);
}
