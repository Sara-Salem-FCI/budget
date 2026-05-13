import 'package:budget/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/features/home/presentation/widgets/custom_search_bar.dart';
import 'package:budget/features/home/presentation/widgets/section_header_widget.dart';
import 'package:budget/features/home/presentation/widgets/horizontal_car_list.dart';
import 'package:budget/features/home/presentation/widgets/car_card.dart';
import 'package:budget/features/search/presentation/cubit/search_cubit.dart';
import 'package:budget/features/search/presentation/cubit/search_state.dart';
import 'package:budget/features/search/presentation/widgets/recent_search_item.dart';
import 'package:budget/features/filter/presentation/widgets/filter_bottom_sheet.dart';
import 'package:budget/core/router/app_router.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:budget/features/filter/data/models/filter_request_model.dart';

class SearchPage extends StatefulWidget {
  final String? initialQuery;
  final FilterRequestModel? initialFilter;

  const SearchPage({super.key, this.initialQuery, this.initialFilter});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialQuery?.isNotEmpty == true) {
      _searchController.text = widget.initialQuery!;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          context.read<SearchCubit>().search(widget.initialQuery!);
        }
      });
    } else if (widget.initialFilter != null) {
      if (widget.initialFilter!.search?.isNotEmpty == true) {
        _searchController.text = widget.initialFilter!.search!;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          context.read<SearchCubit>().applyFilter(widget.initialFilter!);
        }
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => GetIt.instance<SearchCubit>()..loadInitialData(),
      child: Builder(
        builder: (context) {
          return VisibilityDetector(
            key: const Key('search_page'),
            onVisibilityChanged: (info) {
              if (info.visibleFraction == 1.0) {
                context.read<SearchCubit>().loadInitialData();
              }
            },
            child: Scaffold(
              backgroundColor: AppColors.background,
              appBar: AppBar(
                backgroundColor: AppColors.background,
                elevation: 0,
                title: Text(l10n.nav_search, style: AppStyles.heading2),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: CustomSearchBar(
                      controller: _searchController,
                      onChanged: (query) {
                        // Debounce could be added here
                      },
                      onSubmitted: (query) {
                        context.read<SearchCubit>().search(query);
                      },
                      onFilterTap: () async {
                        final searchCubit = context.read<SearchCubit>();
                        final filterReq = await FilterBottomSheet.show(context);
                        if (filterReq != null) {
                          final combinedReq = filterReq.copyWith(
                            search: _searchController.text.isNotEmpty
                                ? _searchController.text
                                : null,
                          );
                          searchCubit.applyFilter(combinedReq);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) {
                        if (state is SearchLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (state is SearchError) {
                          return Center(
                            child: Text(state.message, style: AppStyles.body1),
                          );
                        }

                        if (state is SearchSuggestionsLoaded) {
                          return _buildSuggestions(context, state, l10n);
                        }

                        if (state is SearchResultsLoaded) {
                          return _buildResults(context, state, l10n);
                        }

                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSuggestions(
    BuildContext context,
    SearchSuggestionsLoaded state,
    AppLocalizations l10n,
  ) {
    return ListView(
      children: [
        if (state.recentSearches.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SectionHeaderWidget(title: l10n.recent, onMoreTap: () {}),
          ),
          ...state.recentSearches.map(
            (history) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RecentSearchItem(
                query: history.query.isEmpty ? l10n.search_hint : history.query,
                onTap: () {
                  _searchController.text = history.query;
                  context.read<SearchCubit>().searchFromHistory(history);
                },
                onRemove: () =>
                    context.read<SearchCubit>().removeRecentSearch(history.id),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SectionHeaderWidget(
            title: l10n.suggested_cars,
            onMoreTap: () => context.push(AppRouter.availableCars),
          ),
        ),
        const SizedBox(height: 16),
        HorizontalCarList(cars: state.suggestedCars),
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildResults(
    BuildContext context,
    SearchResultsLoaded state,
    AppLocalizations l10n,
  ) {
    if (state.results.isEmpty) {
      return Center(child: Text(l10n.no_results, style: AppStyles.body1));
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
      itemCount: state.results.length,
      itemBuilder: (context, index) {
        return CarCard(car: state.results[index], style: CarCardStyle.list);
      },
    );
  }
}
