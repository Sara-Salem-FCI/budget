import 'package:flutter/material.dart';
import 'package:budget/features/home/data/models/car_model.dart';
import 'package:budget/features/home/presentation/widgets/discount_ribbon.dart';
import 'package:budget/l10n/app_localizations.dart';

class CarImageSection extends StatelessWidget {
  final CarModel car;
  final double height;
  final double? borderRadius;

  const CarImageSection({
    super.key,
    required this.car,
    required this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(borderRadius ?? 16),
          ),
          child: Image.network(
            car.carImage,
            height: height,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: height,
                width: double.infinity,
                color: Colors.grey.shade300,
                child: const Icon(Icons.directions_car, size: 50, color: Colors.grey),
              );
            },
          ),
        ),
        if (car.hasDiscount)
          DiscountRibbon(
            label: AppLocalizations.of(context)!.discount_label(car.discount),
          ),
        // Favorite icon removed; handling moved to CarCardList
      ],
    );
  }
}
