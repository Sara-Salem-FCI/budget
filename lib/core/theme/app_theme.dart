import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:budget/core/constants/app_colors.dart';

/// Centralized theme configuration for the application.
abstract class AppTheme {
  /// The light theme configuration.
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        onPrimary: AppColors.white,
        surface: AppColors.white,
      ),
      textTheme: GoogleFonts.ibmPlexSansArabicTextTheme(),
      scaffoldBackgroundColor: AppColors.white,
    );
  }

  /// The dark theme configuration.
  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
        primary: AppColors.primary,
      ),
      textTheme: GoogleFonts.ibmPlexSansArabicTextTheme(
        ThemeData(brightness: Brightness.dark).textTheme,
      ),
    );
  }
}
