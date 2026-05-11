import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/features/filter/presentation/widgets/filter_bottom_sheet.dart';
import 'package:budget/features/home/presentation/widgets/car_card.dart';
import 'package:budget/features/home/presentation/widgets/custom_search_bar.dart';
import 'package:budget/features/search/presentation/cubit/search_cubit.dart';
import 'package:budget/features/search/presentation/cubit/search_state.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AvailableCarsPage extends StatefulWidget {
  const AvailableCarsPage({super.key});

  @override
  State<AvailableCarsPage> createState() => _AvailableCarsPageState();
}

class _AvailableCarsPageState extends State<AvailableCarsPage> {
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
          title: Text(
            l10n.available_cars,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: CustomSearchBar(
                controller: _searchController,
                onSubmitted: (query) {
                  context.read<SearchCubit>().search(query);
                },
                onFilterTap: () async {
                  final filterReq = await FilterBottomSheet.show(context);
                  if (filterReq != null) {
                    final combinedReq = filterReq.copyWith(
                      search: _searchController.text.isNotEmpty ? _searchController.text : null,
                    );
                    if (context.mounted) {
                      context.read<SearchCubit>().applyFilter(combinedReq);
                    }
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
                    return Center(child: Text(state.message));
                  }

                  List<dynamic> cars = [];
                  if (state is SearchSuggestionsLoaded) {
                    cars = state.suggestedCars;
                  } else if (state is SearchResultsLoaded) {
                    cars = state.results;
                  }

                  if (cars.isEmpty) {
                    return Center(child: Text(l10n.no_results));
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.6, // Adjusted for reduced card height
                    ),
                    itemCount: cars.length,
                    itemBuilder: (context, index) {
                      return CarCard(
                        car: cars[index],
                        style: CarCardStyle.grid,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
