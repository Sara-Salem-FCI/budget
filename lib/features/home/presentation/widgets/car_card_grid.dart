import 'package:budget/features/home/data/models/car_model.dart';
import 'package:budget/features/home/presentation/widgets/car_image_section.dart';
import 'package:budget/features/home/presentation/widgets/car_info_row.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CarCardGrid extends StatelessWidget {
  final CarModel car;

  const CarCardGrid({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24), // More rounded as in screenshot
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Right aligned for RTL
        children: [
          CarImageSection(car: car, height: 110, borderRadius: 24),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900, 
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${car.price} ${l10n?.sar ?? 'ر.س'}',
                        style: const TextStyle(
                          color: Color(0xFF003DAB), // Darker blue from screenshot
                          fontWeight: FontWeight.w900,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.attach_money,
                        size: 16,
                        color: Colors.grey.shade400,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  CarInfoRow(
                    icon: Icons.directions_car,
                    text: l10n?.model_year(car.year) ?? 'موديل ${car.year}',
                    alignment: MainAxisAlignment.end,
                  ),
                  if (car.location != null)
                    CarInfoRow(
                      icon: Icons.location_on,
                      text: car.location!.split(',').first,
                      alignment: MainAxisAlignment.end,
                    ),
                  CarInfoRow(
                    icon: Icons.speed,
                    text: l10n?.mileage_km('16,000') ?? '16,000 كم',
                    alignment: MainAxisAlignment.end,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 42,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD6E4FF),
                        foregroundColor: const Color(0xFF003DAB),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: Color(0xFF003DAB), width: 1.5),
                        ),
                      ),
                      child: Text(
                        l10n?.show_details ?? 'عرض التفاصيل',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
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
