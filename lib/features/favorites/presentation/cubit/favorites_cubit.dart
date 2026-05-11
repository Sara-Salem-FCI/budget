import 'package:budget/features/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:budget/features/home/data/models/car_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepository _repository;
  List<CarModel> _allFavorites = [];
  int _currentPage = 1;

  FavoritesCubit(this._repository) : super(FavoritesInitial());

  Future<void> loadFavorites({bool refresh = false}) async {
    if (refresh) {
      _currentPage = 1;
      _allFavorites = [];
    }

    if (_currentPage == 1) {
      emit(FavoritesLoading());
    }

    final result = await _repository.getFavorites(page: _currentPage);

    result.fold(
      (failure) => emit(FavoritesError(failure.message)),
      (response) {
        _allFavorites.addAll(response.cars);
        _currentPage++;
        emit(FavoritesLoaded(
          favorites: List.from(_allFavorites),
          hasReachedMax: response.pagination.currentPage >= response.pagination.lastPage,
        ));
      },
    );
  }

  void filterFavorites(String query) {
    if (state is FavoritesLoaded) {
      if (query.isEmpty) {
        emit(FavoritesLoaded(
          favorites: List.from(_allFavorites),
          hasReachedMax: true, // Simplified for local filtering
        ));
        return;
      }

      final filtered = _allFavorites.where((car) {
        return car.name.toLowerCase().contains(query.toLowerCase()) ||
               car.brand.toLowerCase().contains(query.toLowerCase());
      }).toList();

      emit(FavoritesLoaded(
        favorites: filtered,
        hasReachedMax: true,
      ));
    }
  }

  Future<void> toggleFavorite(CarModel car) async {
    // Optimistic Update
    final bool isRemoving = car.isFav;
    
    if (state is FavoritesLoaded) {
      final currentState = state as FavoritesLoaded;
      List<CarModel> updatedList = List.from(currentState.favorites);
      
      if (isRemoving) {
        updatedList.removeWhere((item) => item.id == car.id);
        _allFavorites.removeWhere((item) => item.id == car.id);
      } else {
        // Adding to favorites
        final addedCar = car.copyWith(isFav: true);
        if (!updatedList.any((e) => e.id == car.id)) {
          updatedList.insert(0, addedCar);
          _allFavorites.insert(0, addedCar);
        }
      }
      
      emit(FavoritesLoaded(
        favorites: updatedList,
        hasReachedMax: currentState.hasReachedMax,
      ));
    } else {
      // If state is not loaded, we clear cache to force a fresh fetch next time
      _currentPage = 1;
      _allFavorites = [];
    }

    final result = await _repository.toggleFavorite(car.id);

    result.fold(
      (failure) {
        // Rollback or show error
        emit(FavoriteToggleActionState(success: false, message: failure.message, carId: car.id));
        // If we were on favorites page and removed it, we might want to reload to be sure
        loadFavorites(refresh: true);
      },
      (success) {
        if (!success) {
          emit(FavoriteToggleActionState(success: false, carId: car.id));
          loadFavorites(refresh: true);
        }
      },
    );
  }
}
