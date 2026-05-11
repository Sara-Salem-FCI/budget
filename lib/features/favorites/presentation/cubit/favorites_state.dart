import 'package:budget/features/home/data/models/car_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object?> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<CarModel> favorites;
  final bool hasReachedMax;

  const FavoritesLoaded({
    required this.favorites,
    required this.hasReachedMax,
  });

  @override
  List<Object?> get props => [favorites, hasReachedMax];
}

class FavoritesError extends FavoritesState {
  final String message;

  const FavoritesError(this.message);

  @override
  List<Object?> get props => [message];
}

class FavoriteToggleActionState extends FavoritesState {
  final bool success;
  final String? message;
  final int carId;

  const FavoriteToggleActionState({
    required this.success,
    required this.carId,
    this.message,
  });

  @override
  List<Object?> get props => [success, message, carId];
}
