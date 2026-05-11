import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class CarDetailsQuickInfo extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const CarDetailsQuickInfo({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: AppStyles.caption.copyWith(
              color: AppColors.grey,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 8),
          Icon(
            icon,
            color: AppColors.grey,
            size: 28,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: AppStyles.body2Bold.copyWith(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
