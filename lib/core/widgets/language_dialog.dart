import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/core/error/failure_localizer.dart';
import 'package:budget/core/widgets/language_dialog_header.dart';
import 'package:budget/core/widgets/language_option_row.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

/// Dialog for choosing app language. Calls [onLanguageSelected] which must
/// return `null` on success or an error message (key or server text) on failure.
class LanguageDialog extends StatefulWidget {
  final String currentLocale;
  final Future<String?> Function(String languageCode) onLanguageSelected;

  const LanguageDialog({
    super.key,
    required this.currentLocale,
    required this.onLanguageSelected,
  });

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  late String _selectedLocale;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _selectedLocale = widget.currentLocale;
  }

  Future<void> _handleSelection(String value) async {
    if (_isSubmitting) return;

    setState(() {
      _isSubmitting = true;
      _selectedLocale = value;
    });

    final errorMessage = await widget.onLanguageSelected(value);

    if (!mounted) return;

    setState(() => _isSubmitting = false);

    if (errorMessage == null) {
      Navigator.pop(context);
    } else {
      setState(() => _selectedLocale = widget.currentLocale);
      final l10n = AppLocalizations.of(context)!;
      final messenger = ScaffoldMessenger.maybeOf(context);
      final resolved = errorMessage.trim().isEmpty
          ? l10n.language_change_failed
          : FailureLocalizer.localize(errorMessage, context);
      messenger?.showSnackBar(
        SnackBar(
          content: Text(
            resolved,
            style: AppStyles.body1.copyWith(color: AppColors.white),
          ),
          backgroundColor: Colors.red.shade700,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      backgroundColor: const Color(0xFFE3EDFF),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LanguageDialogHeader(onClose: () => Navigator.pop(context)),
          const Divider(height: 1, color: Colors.white),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: IgnorePointer(
              ignoring: _isSubmitting,
              child: Opacity(
                opacity: _isSubmitting ? 0.55 : 1,
                child: Column(
                  children: [
                    LanguageOptionRow(
                      title: l10n.arabic,
                      flagEmoji: '🇸🇦',
                      value: 'ar',
                      groupValue: _selectedLocale,
                      enabled: !_isSubmitting,
                      onSelected: _handleSelection,
                    ),
                    LanguageOptionRow(
                      title: l10n.english,
                      flagEmoji: '🇺🇸',
                      value: 'en',
                      groupValue: _selectedLocale,
                      enabled: !_isSubmitting,
                      onSelected: _handleSelection,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
