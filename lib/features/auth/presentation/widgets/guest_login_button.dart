import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/l10n/app_localizations.dart';

class GuestLoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GuestLoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          l10n.login_as_guest,
          style: AppStyles.body1.copyWith(
            color: AppColors.grey,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.underline,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
