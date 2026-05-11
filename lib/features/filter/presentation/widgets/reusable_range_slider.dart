import 'package:budget/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:budget/core/constants/app_colors.dart';
import 'filter_min_max_indicator.dart';

class ReusableRangeSlider extends StatelessWidget {
  final String title;
  final RangeValues values;
  final double min;
  final double max;
  final String unit;
  final ValueChanged<RangeValues> onChanged;

  const ReusableRangeSlider({
    super.key,
    required this.title,
    required this.values,
    required this.min,
    required this.max,
    required this.unit,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.heading3),
        const SizedBox(height: 16),
        RangeSlider(
          values: values,
          min: min,
          max: max,
          activeColor: AppColors.primary,
          inactiveColor: Colors.grey.shade200,
          onChanged: onChanged,
        ),
        FilterMinMaxIndicator(
          min: values.start.round().toString(),
          max: values.end.round().toString(),
          unit: unit,
        ),
      ],
    );
  }
}
