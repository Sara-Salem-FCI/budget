import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/features/filter/presentation/cubit/filter_cubit.dart';
import 'package:budget/features/filter/presentation/cubit/filter_state.dart';
import 'package:budget/l10n/app_localizations.dart';

class FilterBottomSheetFooter extends StatelessWidget {
  final FilterState state;

  const FilterBottomSheetFooter({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                context.read<FilterCubit>().resetFilters();
              },
              child: Text(l10n.reset),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              onPressed: () {
                Navigator.pop(context, state.request);
              },
              child: Text(l10n.apply, style: const TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
