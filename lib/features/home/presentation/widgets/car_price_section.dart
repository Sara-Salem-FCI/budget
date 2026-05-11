import 'package:flutter/material.dart';
import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/features/home/data/models/car_model.dart';
import 'package:budget/l10n/app_localizations.dart';

class CarPriceSection extends StatelessWidget {
  final CarModel car;
  final bool showButton;

  const CarPriceSection({
    super.key,
    required this.car,
    this.showButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '${car.price} ${l10n?.sar ?? 'ر.س'}',
          style: const TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showButton) ...[
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              AppLocalizations.of(context)?.show_details ?? 'عرض التفاصيل',
              style: const TextStyle(color: Colors.white, fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ],
    );
  }
}
