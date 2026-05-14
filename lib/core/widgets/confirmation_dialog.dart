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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      elevation: 8,
      backgroundColor: Colors.transparent,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE3EDF7),
              Colors.white,
            ],
          ),

        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 24),
            // Header
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppStyles.heading3.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(height: 1, color: Colors.white.withValues(alpha: 0.8)),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: AppStyles.body1.copyWith(
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(height: 1, color: Colors.white.withValues(alpha: 0.8)),
            ),
            // Buttons
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.3),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: onNo ?? () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: const RoundedRectangleBorder(),
                      ),
                      child: Text(
                        noText,
                        style: AppStyles.body1.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    color: Colors.grey.withValues(alpha: 0.1),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: onYes,
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: const RoundedRectangleBorder(),
                      ),
                      child: Text(
                        yesText,
                        style: AppStyles.body1.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

