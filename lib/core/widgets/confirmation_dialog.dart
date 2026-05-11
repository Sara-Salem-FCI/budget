import 'package:budget/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String yesText;
  final String noText;
  final VoidCallback onYes;
  final VoidCallback? onNo;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    required this.yesText,
    required this.noText,
    required this.onYes,
    this.onNo,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: const BoxDecoration(
              color: Color(0xFFE3EDFF),
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppStyles.heading3.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const Divider(height: 1, color: Colors.white),
          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: AppStyles.body1.copyWith(
                color: Colors.black,
                height: 1.5,
              ),
            ),
          ),
          const Divider(height: 1, color: Colors.grey),
          // Buttons
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: onNo ?? () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    noText,
                    style: AppStyles.body1.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(width: 1, height: 56, color: Colors.grey.shade300),
              Expanded(
                child: TextButton(
                  onPressed: onYes,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    yesText,
                    style: AppStyles.body1.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
