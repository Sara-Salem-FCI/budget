import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/features/home/data/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:budget/core/constants/app_colors.dart';

class CarPriceSection extends StatelessWidget {
  final CarModel car;

  const CarPriceSection({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${car.price} ر.س',
          style: AppStyles.heading3.copyWith(
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
