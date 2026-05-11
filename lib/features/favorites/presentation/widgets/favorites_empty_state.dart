import 'package:budget/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class FavoritesEmptyState extends StatelessWidget {
  const FavoritesEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              // Main outer circle
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade200, width: 2),
                ),
              ),
              
              // Prohibited car graphic
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.directions_car_filled,
                        size: 60,
                        color: Colors.grey.shade400,
                      ),
                      Icon(
                        Icons.block,
                        size: 90,
                        color: Colors.red.withValues(alpha: 0.5),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Shadow ellipse
                  Container(
                    width: 60,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300.withValues(alpha: 0.5),
                      borderRadius: const BorderRadius.all(Radius.elliptical(30, 5)),
                    ),
                  ),
                ],
              ),
              
              // Zero badge
              Positioned(
                top: 15,
                right: 15,
                child: Container(
                  width: 45,
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Text(
                    '0',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            l10n.no_favorites_yet,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
