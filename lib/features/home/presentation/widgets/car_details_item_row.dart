import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class CarDetailsItemRow extends StatelessWidget {
  final String title;
  final String value;
  final bool showDivider;

  const CarDetailsItemRow({
    super.key,
    required this.title,
    required this.value,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            children: [
              Text(
                title,
                style: AppStyles.bodySmall.copyWith(
                  color: AppColors.grey,
                  fontSize: 15,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_back_ios_new,
                size: 14,
                color: AppColors.grey,
              ),
              const SizedBox(width: 24),
              Text(
                value,
                style: AppStyles.body2Bold.copyWith(
                  fontSize: 15,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
        if (showDivider)
          Divider(
            color: Colors.grey.withValues(alpha: 0.1),
            height: 1,
          ),
      ],
    );
  }
}
