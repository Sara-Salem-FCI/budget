import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/features/filter/data/models/filter_options_model.dart';
import 'package:budget/features/filter/presentation/cubit/filter_cubit.dart';
import 'package:budget/l10n/app_localizations.dart';

class FilterBrands extends StatelessWidget {
  final List<FilterBrand> brands;
  final List<int> selectedIds;

  const FilterBrands({
    super.key,
    required this.brands,
    required this.selectedIds,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.brand, style: AppStyles.heading3),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: brands.map((brand) {
            final isSelected = selectedIds.contains(brand.id);
            return FilterChip(
              label: Text(brand.name),
              selected: isSelected,
              onSelected: (_) {
                context.read<FilterCubit>().toggleBrand(brand.id);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
