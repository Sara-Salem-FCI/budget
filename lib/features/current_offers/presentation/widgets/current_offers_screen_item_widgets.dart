import 'package:budget/core/constants/app_colors.dart';
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
class CurrentOfferScreenItem extends StatelessWidget {
  final CarModel car;

  const CurrentOfferScreenItem({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Image Section (Top Rounded)
          Expanded(
            flex: 5,
            child: CarImageSection(
              car: car,
              height: double.infinity,
              borderRadius: 24,
            ),
          ),

          // 2. Content Section
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.white,
                    const Color(0xFFD6E4FF).withValues(alpha: 0.4),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _PriceSection(car: car, l10n: l10n),
                  const SizedBox(height: 6),
                  _InfoSection(car: car, l10n: l10n),
                  const Spacer(),
                  _DetailsButton(l10n: l10n, car: car),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceSection extends StatelessWidget {
  final CarModel car;
  final AppLocalizations l10n;

  const _PriceSection({required this.car, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${car.price} ${l10n.sar}',
      style: AppStyles.body2ExtraBold.copyWith(
        color: const Color(0xFF003DAB),
        fontSize: 16,
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  final CarModel car;
  final AppLocalizations l10n;

  const _InfoSection({required this.car, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          icon: Icons.location_on_outlined,
          label: car.location ?? l10n.riyadh,
        ),
        const SizedBox(height: 2),
        CarInfoRow(
          icon: Icons.speed_outlined,
          label: l10n.mileage_km('16,000'),
        ),
      ],
    );
  }
}

class _DetailsButton extends StatelessWidget {
  final AppLocalizations l10n;
  final CarModel car;

  const _DetailsButton({required this.l10n, required this.car});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 38,
      child: ElevatedButton(
        onPressed: () => context.push(AppRouter.carDetails, extra: car),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          l10n.show_details,
          style: AppStyles.captionBold.copyWith(
            fontSize: 11,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
