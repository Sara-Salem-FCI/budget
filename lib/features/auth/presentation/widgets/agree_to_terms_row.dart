import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/l10n/app_localizations.dart';

class AgreeToTermsRow extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onTermsTap;

  const AgreeToTermsRow({
    super.key,
    required this.value,
    required this.onChanged,
    required this.onTermsTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.deepBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
          side: const BorderSide(color: AppColors.lightGrey),
        ),
        Text(
          l10n.agree_to_terms,
          style: AppStyles.caption.copyWith(
            color: AppColors.grey,
            fontSize: 12.sp,
          ),
        ),
        TextButton(
          onPressed: onTermsTap,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: Text(
            l10n.terms_and_conditions,
            style: AppStyles.caption.copyWith(
              color: AppColors.deepBlue,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }
}
