import 'package:flutter/material.dart';
import 'package:budget/features/home/data/models/car_model.dart';
import 'car_image_section.dart';
import 'car_details_section.dart';
import 'car_price_section.dart';

class CarCardHorizontal extends StatelessWidget {
  final CarModel car;
  final double width;

  const CarCardHorizontal({
    super.key,
    required this.car,
    this.width = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarImageSection(car: car, height: 150),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: CarDetailsSection(car: car),
                ),
                const SizedBox(width: 8),
                Flexible(
                  flex: 2,
                  child: CarPriceSection(car: car),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
