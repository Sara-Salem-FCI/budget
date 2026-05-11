import 'package:flutter/material.dart';
import 'filter_min_max_indicator.dart';

class ReusableRangeSlider extends StatelessWidget {
  final String title;
  final int? currentMin;
  final int? currentMax;
  final int absoluteMin;
  final int absoluteMax;
  final String unit;
  final String minLabel;
  final String maxLabel;
  final Function(int, int) onChanged;

  const ReusableRangeSlider({
    super.key,
    required this.title,
    required this.currentMin,
    required this.currentMax,
    required this.absoluteMin,
    required this.absoluteMax,
    required this.unit,
    required this.minLabel,
    required this.maxLabel,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        RangeSlider(
          values: RangeValues(
            (currentMin ?? absoluteMin).toDouble(),
            (currentMax ?? absoluteMax).toDouble(),
          ),
          min: absoluteMin.toDouble(),
          max: absoluteMax.toDouble(),
          divisions: 100,
          onChanged: (values) {
            onChanged(values.start.toInt(), values.end.toInt());
          },
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilterMinMaxIndicator(
              label: minLabel,
              value: '${currentMin ?? absoluteMin} $unit',
            ),
            FilterMinMaxIndicator(
              label: maxLabel,
              value: '${currentMax ?? absoluteMax} $unit',
            ),
          ],
        ),
      ],
    );
  }
}
