import 'package:budget/core/widgets/confirmation_dialog.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

/// Confirmation step before calling [onConfirmDelete] (API + local session clear).
class DeleteAccountConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirmDelete;

  const DeleteAccountConfirmationDialog({
    super.key,
    required this.onConfirmDelete,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ConfirmationDialog(
      title: l10n.delete_account,
      message: l10n.delete_account_confirmation,
      yesText: l10n.delete_account_confirm_action,
      noText: l10n.no,
      onYes: onConfirmDelete,
    );
  }
}
