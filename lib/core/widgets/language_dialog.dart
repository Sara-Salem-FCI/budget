import 'package:budget/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class LanguageDialog extends StatefulWidget {
  final String currentLocale;
  final ValueChanged<String> onLanguageSelected;

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

  @override
  void initState() {
    super.initState();
    _selectedLocale = widget.currentLocale;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      backgroundColor: Color(0xFFE3EDFF),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Container(
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
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Text(
                  'اللغة',
                  style: AppStyles.heading3.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Colors.white),
          // List
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                _buildLanguageItem(
                  title: 'العربية',
                  flag: '🇸🇦',
                  value: 'ar',
                ),
                _buildLanguageItem(
                  title: 'الانجليزية',
                  flag: '🇺🇸',
                  value: 'en',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildLanguageItem({
    required String title,
    required String flag,
    required String value,
  }) {
    final isSelected = _selectedLocale == value;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedLocale = value;
        });
        widget.onLanguageSelected(value);
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            Radio<String>(
              value: value,
              groupValue: _selectedLocale,
              onChanged: (val) {
                if (val != null) {
                  setState(() {
                    _selectedLocale = val;
                  });
                  widget.onLanguageSelected(val);
                  Navigator.pop(context);
                }
              },
              activeColor: const Color(0xFF4CAF50),
            ),
            Text(
              flag,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 5),
            Text(
              title,
              style: AppStyles.body1.copyWith(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
