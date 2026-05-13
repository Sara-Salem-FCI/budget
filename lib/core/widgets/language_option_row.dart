import 'package:budget/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

/// Single selectable language entry for [LanguageDialog].
class LanguageOptionRow extends StatelessWidget {
  final String title;
  final String flagEmoji;
  final String value;
  final String groupValue;
  final Future<void> Function(String languageCode) onSelected;
  final bool enabled;

  const LanguageOptionRow({
    super.key,
    required this.title,
    required this.flagEmoji,
    required this.value,
    required this.groupValue,
    required this.onSelected,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = groupValue == value;

    return RadioListTile<String>(
      value: value,
      groupValue: groupValue,
      onChanged: !enabled
          ? null
          : (selected) async {
              if (selected != null) {
                await onSelected(selected);
              }
            },
      activeColor: const Color(0xFF4CAF50),
      title: Row(
        children: [
          Text(flagEmoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: AppStyles.body1.copyWith(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }
}
