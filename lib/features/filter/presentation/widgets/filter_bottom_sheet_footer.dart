import 'package:budget/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/l10n/app_localizations.dart';

class FilterBottomSheetFooter extends StatelessWidget {
  final VoidCallback onApply;

  const FilterBottomSheetFooter({super.key, required this.onApply});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: onApply,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: Text(
              l10n.apply,
              style: AppStyles.buttonText,
            ),
          ),
        ),
      ),
    );
  }
}
