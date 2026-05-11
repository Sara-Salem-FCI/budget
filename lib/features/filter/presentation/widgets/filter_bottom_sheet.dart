import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:budget/features/filter/data/models/filter_request_model.dart';
import 'package:budget/features/filter/presentation/cubit/filter_cubit.dart';
import 'package:budget/features/filter/presentation/cubit/filter_state.dart';
import 'package:budget/l10n/app_localizations.dart';

import 'filter_bottom_sheet_header.dart';
import 'filter_bottom_sheet_footer.dart';
import 'reusable_range_slider.dart';
import 'filter_brands.dart';
import 'filter_fuel_types.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  static Future<FilterRequestModel?> show(BuildContext context) {
    return showModalBottomSheet<FilterRequestModel>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => BlocProvider(
        create: (_) => GetIt.instance<FilterCubit>()..loadFilterOptions(),
        child: const FilterBottomSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return BlocBuilder<FilterCubit, FilterState>(
          builder: (context, state) {
            if (state.status == FilterStatus.loading || state.status == FilterStatus.initial) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == FilterStatus.error) {
              return Center(child: Text(state.errorMessage ?? 'Error loading filters'));
            }

            final options = state.options!;
            final req = state.request;

            return Column(
              children: [
                const FilterBottomSheetHeader(),
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    padding: const EdgeInsets.all(20),
                    children: [
                      ReusableRangeSlider(
                        title: AppLocalizations.of(context)!.price,
                        currentMin: req.minPrice,
                        currentMax: req.maxPrice,
                        absoluteMin: 0,
                        absoluteMax: 500000,
                        unit: AppLocalizations.of(context)!.sar,
                        minLabel: AppLocalizations.of(context)!.min_limit,
                        maxLabel: AppLocalizations.of(context)!.max_limit,
                        onChanged: (min, max) => context.read<FilterCubit>().updatePriceRange(min, max),
                      ),
                      const SizedBox(height: 24),
                      const Divider(),
                      const SizedBox(height: 24),
                      FilterBrands(brands: options.brands, selectedIds: req.brandIds ?? []),
                      const SizedBox(height: 24),
                      const Divider(),
                      const SizedBox(height: 24),
                      FilterFuelTypes(fuelTypes: options.fuelTypes, selectedIds: req.fuelTypeIds ?? []),
                      const SizedBox(height: 24),
                      const Divider(),
                      const SizedBox(height: 24),
                      ReusableRangeSlider(
                        title: AppLocalizations.of(context)!.car_mileage,
                        currentMin: req.minMileage,
                        currentMax: req.maxMileage,
                        absoluteMin: 0,
                        absoluteMax: 200000,
                        unit: AppLocalizations.of(context)!.km,
                        minLabel: AppLocalizations.of(context)!.min_limit,
                        maxLabel: AppLocalizations.of(context)!.max_limit,
                        onChanged: (min, max) => context.read<FilterCubit>().updateMileageRange(min, max),
                      ),
                      const SizedBox(height: 32),
                      FilterBottomSheetFooter(state: state),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }


}
