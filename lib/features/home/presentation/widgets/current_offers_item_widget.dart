import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/core/router/app_router.dart';
import 'package:budget/features/home/data/models/car_model.dart';
import 'package:budget/features/home/presentation/widgets/car_image_section.dart';
import 'package:budget/features/home/presentation/widgets/car_info_row.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A premium vertical card widget designed specifically for the "Current Offers" page.
/// It features a rounded top image, price section with brand colors, and car details.
class CurrentOffersItemWidget extends StatelessWidget {
  final CarModel car;

  const CurrentOffersItemWidget({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
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
              height: 140,
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title & Info
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          car.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.body2ExtraBold.copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        CarInfoRow(
                          icon: Icons.directions_car_outlined,
                          label: l10n.model_year(car.year),
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
                          label: car.distance ?? '',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Price & Button
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${car.price} ${l10n.sar}',
                          style: AppStyles.body2ExtraBold.copyWith(
                            color: const Color(0xFF003DAB),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          height: 36,
                          child: ElevatedButton(
                            onPressed: () => context.push(AppRouter.carDetails, extra: car),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF053E94),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              l10n.show_details,
                              style: AppStyles.captionBold.copyWith(
                                fontSize: 11,
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