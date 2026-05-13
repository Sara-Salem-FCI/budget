import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/features/home/presentation/widgets/current_offers_item_widget.dart';
import 'package:budget/features/filter/presentation/widgets/filter_bottom_sheet.dart';
import 'package:budget/features/home/presentation/widgets/custom_search_bar.dart';
import 'package:budget/features/search/presentation/cubit/search_cubit.dart';
import 'package:budget/features/search/presentation/cubit/search_state.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CurrentOffersPage extends StatefulWidget {
  const CurrentOffersPage({super.key});

  @override
  State<CurrentOffersPage> createState() => _CurrentOffersPageState();
}

class _CurrentOffersPageState extends State<CurrentOffersPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => GetIt.I<SearchCubit>()..loadInitialData(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          centerTitle: true,
          title: Text(l10n.current_offers, style: AppStyles.heading2),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Builder(
          builder: (context) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: CustomSearchBar(
                    controller: _searchController,
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
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is SearchError) {
                        return Center(
                          child: Text(state.message, style: AppStyles.body1),
                        );
                      }

                      List<dynamic> cars = [];
                      if (state is SearchSuggestionsLoaded) {
                        cars = state.suggestedCars;
                      } else if (state is SearchResultsLoaded) {
                        cars = state.results;
                      }

                      if (cars.isEmpty) {
                        return Center(
                          child: Text(l10n.no_results, style: AppStyles.body1),
                        );
                      }

                      return ListView.separated(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                        itemCount: cars.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          return CurrentOffersItemWidget(car: cars[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
