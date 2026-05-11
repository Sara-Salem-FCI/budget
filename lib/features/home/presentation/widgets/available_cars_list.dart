import 'package:flutter/material.dart';
import 'package:budget/features/home/data/models/car_model.dart';
import 'package:budget/features/home/presentation/widgets/car_card.dart';

class AvailableCarsList extends StatelessWidget {
  final List<CarModel> cars;

  const AvailableCarsList({super.key, required this.cars});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final car = cars[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CarCard(
                car: car,
                style: CarCardStyle.horizontal,
                width: double.infinity,
              ),
            );
          },
          childCount: cars.length,
        ),
      ),
    );
  }
}
