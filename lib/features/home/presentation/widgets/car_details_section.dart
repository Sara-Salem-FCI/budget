import 'package:flutter/material.dart';
import 'package:budget/features/home/data/models/car_model.dart';
import 'car_info_row.dart';

import 'package:budget/l10n/app_localizations.dart';

class CarDetailsSection extends StatelessWidget {
  final CarModel car;

  const CarDetailsSection({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
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
          text: l10n.model_year(car.year),
        ),
        if (car.location != null)
          CarInfoRow(
            icon: Icons.location_on,
            text: car.location!.split(',').first,
          ),
        CarInfoRow(
          icon: Icons.speed,
          text: l10n.mileage_km('16,000'),
        ),
      ],
    );
  }
}
