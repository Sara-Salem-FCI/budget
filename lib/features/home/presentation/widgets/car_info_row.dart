import 'package:budget/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class CarInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;

  const CarInfoRow({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 14,
          color: Colors.grey.shade400,
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: AppStyles.captionLight.copyWith(
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
