import 'package:flutter/material.dart';
import 'package:budget/features/home/data/models/car_model.dart';
import 'package:budget/features/home/presentation/widgets/car_card_horizontal.dart';

class HorizontalCarList extends StatelessWidget {
  final List<CarModel> cars;
  final double height;
  final double itemWidth;

  const HorizontalCarList({
    super.key,
    required this.cars,
    this.height = 248, // Reduced height to remove unused bottom space
    this.itemWidth = 280,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: cars.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return CarCardHorizontal(
            car: cars[index],
            width: itemWidth,
          );
        },
      ),
    );
  }
}
