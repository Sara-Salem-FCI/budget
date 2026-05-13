import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/features/home/data/models/car_model.dart';
import 'package:budget/features/home/presentation/widgets/car_info_row.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CarDetailsSection extends StatelessWidget {
  final CarModel car;

  const CarDetailsSection({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          car.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.heading3.copyWith(fontSize: 16, color: Colors.black),
        ),
        const SizedBox(height: 8),
        CarInfoRow(
          icon: Icons.directions_car,
          label: l10n?.model_year(car.year) ?? 'موديل ${car.year}',
        ),
        if (car.location != null)
          CarInfoRow(
            icon: Icons.location_on,
            label: car.location!.split(',').first,
          ),
      ],
    );
  }
}
