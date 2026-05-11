import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:budget/features/favorites/presentation/cubit/favorites_state.dart';
import 'package:budget/features/favorites/presentation/widgets/favorites_empty_state.dart';
import 'package:budget/features/home/presentation/widgets/car_card.dart';
import 'package:budget/features/auth/presentation/widgets/need_login_widget.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../../core/di/service_locator.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => getIt<FavoritesCubit>()..loadFavorites(),
      child: Builder(
        builder: (context) {
          return VisibilityDetector(
            key: const Key('favorites_page'),
            onVisibilityChanged: (info) {
              if (info.visibleFraction == 1.0) {
                context.read<FavoritesCubit>().loadFavorites(refresh: true);
              }
            },
            child: Scaffold(
              backgroundColor: AppColors.background,
              appBar: AppBar(
                backgroundColor: AppColors.background,
                elevation: 0,
                title: Text(
                  l10n.nav_favorites,
                  style: AppStyles.heading2,
                ),
                centerTitle: true,
              ),
              body: BlocBuilder<FavoritesCubit, FavoritesState>(
                builder: (context, state) {
                  if (state is FavoritesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is FavoritesError) {
                    if (state.message.contains('Unauthenticated')) {
                      return const NeedLoginWidget();
                    }
                    return Center(
                      child: Text(
                        state.message,
                        style: AppStyles.body1,
                      ),
                    );
                  }

                  if (state is FavoritesLoaded) {
                    if (state.favorites.isEmpty) {
                      return const FavoritesEmptyState();
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: state.favorites.length,
                      itemBuilder: (context, index) {
                        return CarCard(
                          car: state.favorites[index],
                          style: CarCardStyle.list,
                        );
                      },
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
