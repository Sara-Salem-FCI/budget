import 'package:flutter/material.dart';
import 'package:budget/features/home/data/models/car_model.dart';
import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'car_image_section.dart';
import 'car_details_section.dart';
import 'car_price_section.dart';
import 'car_info_row.dart';

enum CarCardStyle { horizontal, grid, list }

class CarCard extends StatelessWidget {
  final CarModel car;
  final CarCardStyle style;
  final double width;

  const CarCard({
    super.key,
    required this.car,
    this.style = CarCardStyle.horizontal,
    this.width = 300,
  });

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case CarCardStyle.horizontal:
        return _buildHorizontalStyle(context);
      case CarCardStyle.grid:
        return _buildGridStyle(context);
      case CarCardStyle.list:
        return _buildListStyle(context);
    }
  }

  Widget _buildHorizontalStyle(BuildContext context) {
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

  Widget _buildGridStyle(BuildContext context) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarImageSection(car: car, height: 120),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  car.name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  '${car.price} ر.س',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                CarInfoRow(icon: Icons.directions_car, text: 'موديل ${car.year}'),
                if (car.location != null)
                  CarInfoRow(icon: Icons.location_on, text: car.location!.split(',').first),
                const CarInfoRow(icon: Icons.speed, text: '16,000 كم'),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade50,
                      foregroundColor: AppColors.primary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(AppLocalizations.of(context)?.show_details ?? 'عرض التفاصيل'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListStyle(BuildContext context) {
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
            width: 120,
            child: CarImageSection(car: car, height: 120),
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
