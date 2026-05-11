import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budget/core/constants/app_colors.dart';

/// Centralized text styles for the application.
abstract class AppStyles {
  /// Hero style for onboarding titles.
  static TextStyle get heading1 => GoogleFonts.ibmPlexSansArabic(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      );

  /// Main titles for headers and sections.
  static TextStyle get heading2 => GoogleFonts.ibmPlexSansArabic(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      );

  static TextStyle get heading3 => GoogleFonts.ibmPlexSansArabic(
        fontSize: 17.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
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
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
      );

  /// Small metadata or caption text.
  static TextStyle get caption => GoogleFonts.ibmPlexSansArabic(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.grey,
      );

  static TextStyle get captionLight => GoogleFonts.ibmPlexSansArabic(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.white,
      );

  /// Bold variant of body1.
  static TextStyle get body1Bold => body1.copyWith(
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      );

  static TextStyle get body2Bold => body2.copyWith(
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      );

  static TextStyle get body2ExtraBold => body2.copyWith(
        fontWeight: FontWeight.w800,
        color: AppColors.primary,
      );

  static TextStyle get captionBold => caption.copyWith(
        fontWeight: FontWeight.bold,
      );
}
