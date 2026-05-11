import 'package:flutter/material.dart';
import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/l10n/app_localizations.dart';

class SectionHeaderWidget extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onMoreTap;

  const SectionHeaderWidget({
    super.key,
    required this.title,
    this.actionText,
    this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppStyles.heading2.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (onMoreTap != null)
            GestureDetector(
              onTap: onMoreTap,
              child: Text(
                actionText ?? l10n.more,
                style: const TextStyle(
                  color: Color(0xFF003DAB),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
