import 'package:budget/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class FilterMinMaxIndicator extends StatelessWidget {
  final String min;
  final String max;
  final String unit;

  const FilterMinMaxIndicator({
    super.key,
    required this.min,
    required this.max,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'من',
              style: AppStyles.captionLight.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              '$min $unit',
              style: AppStyles.bodySmall.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'إلى',
              style: AppStyles.captionLight.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              '$max $unit',
              style: AppStyles.bodySmall.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
