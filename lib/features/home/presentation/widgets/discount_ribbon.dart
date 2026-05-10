import 'package:flutter/material.dart';
import 'package:budget/core/constants/app_colors.dart';

import 'package:budget/l10n/app_localizations.dart';

class DiscountRibbon extends StatelessWidget {
  final int discountPercentage;

  const DiscountRibbon({
    super.key,
    required this.discountPercentage,
  });

  @override
  Widget build(BuildContext context) {
    if (discountPercentage <= 0) return const SizedBox.shrink();
    final l10n = AppLocalizations.of(context)!;

    return Positioned(
      top: 10,
      right: -30,
      child: Transform.rotate(
        angle: 0.785398, // 45 degrees in radians
        child: Container(
          color: AppColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
          child: Text(
            l10n.discount_label(discountPercentage),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
