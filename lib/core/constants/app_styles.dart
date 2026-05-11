import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

/// Centralized text styles for the application.
abstract class AppStyles {
  /// Large bold heading for onboarding and screen titles.
  static TextStyle get heading1 => GoogleFonts.ibmPlexSansArabic(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );

  static TextStyle get heading2 => GoogleFonts.ibmPlexSansArabic(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );

  static TextStyle get heading3 => GoogleFonts.ibmPlexSansArabic(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      );

  /// Standard body text for descriptions and paragraphs.
  static TextStyle get body1 => GoogleFonts.ibmPlexSansArabic(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.grey,
        height: 1.5,
      );

  static TextStyle get body2 => GoogleFonts.ibmPlexSansArabic(
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      );

  static TextStyle get bodySmall => GoogleFonts.ibmPlexSansArabic(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.grey,
      );

  /// Style for primary buttons.
  static TextStyle get buttonText => GoogleFonts.ibmPlexSansArabic(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      );

  /// Style for secondary/text buttons.
  static TextStyle get textButton => GoogleFonts.ibmPlexSansArabic(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.grey,
      );

  /// Small caption text for tags or small UI elements.
  static TextStyle get caption => GoogleFonts.ibmPlexSansArabic(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.grey,
      );

  static TextStyle get captionLight => GoogleFonts.ibmPlexSansArabic(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.grey,
      );
}
