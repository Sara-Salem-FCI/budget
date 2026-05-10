import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/l10n/app_localizations.dart';

class ForgotPasswordLink extends StatelessWidget {
  final VoidCallback onTap;

  const ForgotPasswordLink({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      child: Text(
        l10n.forgot_password,
        style: AppStyles.caption.copyWith(
          color: AppColors.deepBlue,
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.underline,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
