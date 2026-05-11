import 'package:budget/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:budget/l10n/app_localizations.dart';

class FilterBottomSheetHeader extends StatelessWidget {
  final VoidCallback onReset;

  const FilterBottomSheetHeader({super.key, required this.onReset});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              l10n.filter,
              style: AppStyles.heading2,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: onReset,
              child: Text(
                l10n.reset,
                style: AppStyles.textButton.copyWith(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
