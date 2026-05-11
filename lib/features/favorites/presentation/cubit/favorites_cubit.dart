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
      // Note: We don't clear _allFavorites here yet to keep the old data visible
      // during the refresh, matching the "update directly" requirement.
    }

    // Only show loading indicator if we don't have any data yet
    if (_allFavorites.isEmpty) {
      emit(FavoritesLoading());
    }

    final result = await _repository.getFavorites(page: _currentPage);

    result.fold(
      (failure) {
        if (_allFavorites.isEmpty) {
          emit(FavoritesError(failure.message));
        }
        // If we already have data, we just stay in Loaded state 
        // maybe show a toast or silent error.
      },
      (response) {
        if (refresh) {
          _allFavorites = response.cars;
        } else {
          _allFavorites.addAll(response.cars);
        }
        
        _currentPage = refresh ? 2 : _currentPage + 1;
        
        emit(FavoritesLoaded(
          favorites: List.from(_allFavorites),
          hasReachedMax: response.pagination.currentPage >= response.pagination.lastPage,
        ));
      },
    );
  }

  void filterFavorites(String query) {
    if (state is FavoritesLoaded || state is FavoritesInitial) {
      if (query.isEmpty) {
        emit(FavoritesLoaded(
          favorites: List.from(_allFavorites),
          hasReachedMax: true, 
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
    final bool isRemoving = car.isFav;
    
    // Optimistic UI update
    if (state is FavoritesLoaded) {
      final currentState = state as FavoritesLoaded;
      List<CarModel> updatedList = List.from(currentState.favorites);
      
      if (isRemoving) {
        updatedList.removeWhere((item) => item.id == car.id);
        _allFavorites.removeWhere((item) => item.id == car.id);
      } else {
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
    }

    final result = await _repository.toggleFavorite(car.id);

    result.fold(
      (failure) {
        emit(FavoriteToggleActionState(success: false, message: failure.message, carId: car.id));
        // Force refresh on failure to ensure UI consistency
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
