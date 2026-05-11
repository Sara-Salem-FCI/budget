import 'package:budget/core/constants/app_styles.dart';
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
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top Image Section
            CarImageSection(
              car: car, 
              height: 120, 
              borderRadius: 24,
            ),
            
            // Content Section with Gradient
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    const Color(0xFFD6E4FF).withValues(alpha: 0.4),
                  ],
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Right Column (Title & Info)
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          car.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.body2.copyWith(
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        CarInfoRow(
                          icon: Icons.directions_car_outlined,
                          label: l10n?.model_year(car.year) ?? 'موديل ${car.year}',
                        ),
                        const SizedBox(height: 2),
                        if (car.location != null)
                          CarInfoRow(
                            icon: Icons.location_on_outlined,
                            label: car.location!.split(',').first,
                          ),
                        const SizedBox(height: 2),
                        CarInfoRow(
                          icon: Icons.speed_outlined,
                          label: l10n?.mileage_km('16,000') ?? '16,000 كم',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Left Column (Price & Button)
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${car.price} ${l10n?.sar ?? 'ر.س'}',
                          style: AppStyles.body2.copyWith(
                            color: const Color(0xFF003DAB),
                            fontWeight: FontWeight.w900,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 4),
                        SizedBox(
                          width: double.infinity,
                          height: 32,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF053E94),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              l10n?.show_details ?? 'عرض التفاصيل',
                              style: AppStyles.caption.copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
