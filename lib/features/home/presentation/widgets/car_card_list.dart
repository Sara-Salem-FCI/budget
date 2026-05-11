import 'package:budget/features/home/data/models/car_model.dart';
import 'package:budget/features/home/presentation/widgets/car_details_section.dart';
import 'package:budget/features/home/presentation/widgets/car_image_section.dart';
import 'package:budget/features/home/presentation/widgets/car_price_section.dart';
import 'package:flutter/material.dart';

class CarCardList extends StatelessWidget {
  final CarModel car;

  const CarCardList({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: CarImageSection(car: car, height: 100),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          ),
        ],
      ),
    );
  }
}
