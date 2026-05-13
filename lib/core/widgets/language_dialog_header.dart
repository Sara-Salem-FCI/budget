import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LanguageDialogHeader extends StatelessWidget {
  final VoidCallback onClose;

  const LanguageDialogHeader({
    super.key,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: const BoxDecoration(
        color: Color(0xFFE3EDFF),
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.black),
              onPressed: onClose,
            ),
          ),
          Text(
            l10n.language,
            style: AppStyles.heading3.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
