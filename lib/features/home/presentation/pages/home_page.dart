import 'package:budget/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/features/home/presentation/widgets/home_header.dart';
import 'package:budget/features/home/presentation/widgets/home_banner.dart';
import 'package:budget/features/home/presentation/widgets/custom_search_bar.dart';
import 'package:budget/features/home/presentation/widgets/section_header_widget.dart';
import 'package:budget/features/home/presentation/widgets/horizontal_car_list.dart';
import 'package:budget/features/home/presentation/widgets/available_cars_list.dart';
import 'package:budget/features/home/presentation/cubit/home_cubit.dart';
import 'package:budget/features/home/presentation/cubit/home_state.dart';
import 'package:go_router/go_router.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final homeCubit = GetIt.instance<HomeCubit>()..fetchHomeData();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocProvider.value(
          value: homeCubit,
          child: VisibilityDetector(
            key: const Key('home_page'),
            onVisibilityChanged: (info) {
              if (info.visibleFraction == 1.0) {
                homeCubit.fetchHomeData();
              }
            },
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is HomeError) {
                  return Center(child: Text(state.message));
                }
                if (state is HomeLoaded) {
                  return CustomScrollView(
                    slivers: [
                      // Top App Bar Area
                      SliverToBoxAdapter(child: HomeHeader(user: state.user)),
                      // Banner Section
                      const SliverToBoxAdapter(child: HomeBanner()),
                      // Search Section
                      const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
                          child: CustomSearchBar(),
                        ),
                      ),
                      // Current Offers
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: SectionHeaderWidget(
                                  title: l10n.current_offers,
                                  onMoreTap: () =>
                                      context.push(AppRouter.currentOffers),
                                ),
                              ),
                              const SizedBox(height: 16),
                              HorizontalCarList(cars: state.currentOffers),
                            ],
                          ),
                        ),
                      ),
                      // Available Cars
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SectionHeaderWidget(
                            title: l10n.available_cars,
                            onMoreTap: () =>
                                context.push(AppRouter.availableCars),
                          ),
                        ),
                      ),
                      AvailableCarsList(cars: state.activeCars),
                      // Recently Viewed
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: SectionHeaderWidget(
                                  title: l10n.recently_viewed,
                                ),
                              ),
                              const SizedBox(height: 16),
                              HorizontalCarList(cars: state.lastSeen),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
