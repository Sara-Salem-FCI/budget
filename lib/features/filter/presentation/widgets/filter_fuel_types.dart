import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:budget/features/filter/data/models/filter_options_model.dart';
import 'package:budget/features/filter/presentation/cubit/filter_cubit.dart';
import 'package:budget/l10n/app_localizations.dart';

class FilterFuelTypes extends StatelessWidget {
  final List<FilterFuelType> fuelTypes;
  final List<int> selectedIds;

  const FilterFuelTypes({
    super.key,
    required this.fuelTypes,
    required this.selectedIds,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.fuel_type, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: fuelTypes.map((fuel) {
            final isSelected = selectedIds.contains(fuel.id);
            return ChoiceChip(
              label: Text(fuel.name),
              selected: isSelected,
              onSelected: (_) {
                context.read<FilterCubit>().toggleFuelType(fuel.id);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
