import 'package:budget/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:budget/features/favorites/presentation/cubit/favorites_state.dart';
import 'package:budget/features/favorites/presentation/widgets/favorites_empty_state.dart';
import 'package:budget/features/home/presentation/widgets/car_card.dart';
import 'package:budget/features/home/presentation/widgets/custom_search_bar.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FavoritesCubit>().loadFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          l10n.favorites,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: CustomSearchBar(
                controller: _searchController,
                onChanged: (query) {
                  context.read<FavoritesCubit>().filterFavorites(query);
                },
              ),
            ),
            Expanded(
              child: BlocConsumer<FavoritesCubit, FavoritesState>(
                listener: (context, state) {
                  if (state is FavoriteToggleActionState && !state.success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message ?? l10n.error_unexpected)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is FavoritesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is FavoritesError) {
                    return Center(child: Text(state.message));
                  }

                  if (state is FavoritesLoaded) {
                    if (state.favorites.isEmpty) {
                      return const FavoritesEmptyState();
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: state.favorites.length,
                      itemBuilder: (context, index) {
                        final car = state.favorites[index];
                        return CarCard(
                          car: car,
                          style: CarCardStyle.list,
                        );
                      },
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      );
  }
}
