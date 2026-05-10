import 'package:flutter/material.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/constants/app_styles.dart';

class OnboardingBottomBar extends StatelessWidget {
  final bool isLastPage;
  final VoidCallback onSkip;
  final VoidCallback onNext;

  const OnboardingBottomBar({
    super.key,
    required this.isLastPage,
    required this.onSkip,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Skip Button
          TextButton(
            onPressed: onSkip,
            child: Text(
              l10n.skip,
              style: AppStyles.textButton,
            ),
          ),
          
          // Next / Start Button
          ElevatedButton(
            onPressed: onNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.deepBlue,
              foregroundColor: AppColors.white,
              minimumSize: const Size(120, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 4,
              shadowColor: AppColors.deepBlue.withAlpha(100),
            ),
            child: Text(
              isLastPage ? l10n.start_now : l10n.next,
              style: AppStyles.buttonText,
            ),
          ),
        ],
      ),
    );
  }
}
