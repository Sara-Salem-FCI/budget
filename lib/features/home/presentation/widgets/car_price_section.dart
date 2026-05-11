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
        if (car.hasDiscount) ...[
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFD32F2F),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '-${car.discount}%',
                  style: AppStyles.captionLight.copyWith(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              // We don't have oldPrice in CarModel, 
              // so we just show the discount badge for now.
            ],
          ),
        ],
      ],
    );
  }
}
