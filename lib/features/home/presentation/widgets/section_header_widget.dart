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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.heading2,
        ),
        if (onMoreTap != null)
          GestureDetector(
            onTap: onMoreTap,
            child: Row(
              children: [
                const Icon(
                  Icons.arrow_back,
                  color: Colors.grey,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  actionText ?? l10n.more,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
