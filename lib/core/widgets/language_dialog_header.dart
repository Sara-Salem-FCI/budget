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
      padding: const EdgeInsets.only(top: 24, bottom: 16, left: 16, right: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.black, size: 28),
              onPressed: onClose,
            ),
          ),
          Text(
            l10n.language,
            style: AppStyles.heading3.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
