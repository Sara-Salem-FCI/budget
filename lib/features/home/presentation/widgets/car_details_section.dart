import 'package:flutter/material.dart';
import 'package:budget/features/home/data/models/car_model.dart';
import 'car_info_row.dart';

class CarDetailsSection extends StatelessWidget {
  final CarModel car;

  const CarDetailsSection({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          car.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        CarInfoRow(
          icon: Icons.directions_car,
          text: 'موديل ${car.year}',
        ),
        if (car.location != null)
          CarInfoRow(
            icon: Icons.location_on,
            text: car.location!.split(',').first,
          ),
        const CarInfoRow(
          icon: Icons.speed,
          text: '16,000 كم',
        ),
      ],
    );
  }
}
