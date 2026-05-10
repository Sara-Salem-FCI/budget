import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/l10n/app_localizations.dart';

class OtpTimerRow extends StatelessWidget {
  final int timerSeconds;
  final VoidCallback onResend;

  const OtpTimerRow({
    super.key,
    required this.timerSeconds,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '00:${timerSeconds.toString().padLeft(2, '0')}',
          style: AppStyles.caption.copyWith(
            color: AppColors.deepBlue,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
        ),
        Row(
          children: [
            Text(
              l10n.did_not_receive_code,
              style: AppStyles.caption.copyWith(
                color: AppColors.grey,
                fontSize: 14.sp,
              ),
            ),
            TextButton(
              onPressed: timerSeconds == 0 ? onResend : null,
              child: Text(
                l10n.resend_code,
                style: AppStyles.caption.copyWith(
                  color: timerSeconds == 0 ? AppColors.deepBlue : AppColors.lightGrey,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
