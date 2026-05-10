import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/l10n/app_localizations.dart';

class RememberMeRow extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const RememberMeRow({
    super.key,
    required this.value,
    required this.onChanged,
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
          l10n.remember_me,
          style: AppStyles.caption.copyWith(
            color: AppColors.grey,
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
