import 'package:budget/features/home/data/models/car_model.dart';
import 'package:budget/features/home/presentation/widgets/car_details_section.dart';
import 'package:budget/features/home/presentation/widgets/car_image_section.dart';
import 'package:budget/features/home/presentation/widgets/car_price_section.dart';
import 'package:budget/core/router/app_router.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'package:budget/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/service_locator.dart';
import '../../../auth/data/datasources/auth_local_data_source.dart';
import '../../../favorites/presentation/cubit/favorites_cubit.dart';

class CarCardList extends StatelessWidget {
  final CarModel car;

  const CarCardList({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
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
            width: 100,
            child: CarImageSection(car: car, height: 100),
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
                  // Column for price and button
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                                        // Favorite icon positioned at the top of the price column
                GestureDetector(
                  onTap: () async {
                    final token = await getIt<AuthLocalDataSource>().getToken();
                    if (token == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppLocalizations.of(context)!.please_login),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    context.read<FavoritesCubit>().toggleFavorite(car);
                  },
                  child: Icon(
                    car.isFav ? Icons.favorite : Icons.favorite_border,
                    color: car.isFav ? const Color(0xFF003DAB) : Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(height: 4),
                        CarPriceSection(car: car),
                        const SizedBox(height: 4),
                        SizedBox(
                          width: double.infinity,
                          height: 32,
                          child: ElevatedButton(
                            onPressed: () => context.push(AppRouter.carDetails, extra: car),
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
                              AppLocalizations.of(context)!.show_details,
                              style: AppStyles.captionBold.copyWith(
                                fontSize: 10,
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
          ),
        ],
      ),
    );
  }
}
