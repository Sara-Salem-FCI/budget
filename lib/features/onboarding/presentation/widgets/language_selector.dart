import 'package:flutter/material.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/constants/app_styles.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.white.withAlpha(200),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.lightGrey),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.language, size: 18, color: AppColors.grey),
          const SizedBox(width: 8),
          Text(
            l10n.arabic,
            style: AppStyles.caption,
          ),
        ],
      ),
    );
  }
}
