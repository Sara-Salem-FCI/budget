import 'package:equatable/equatable.dart';
import 'package:budget/features/home/data/models/car_model.dart';
import 'package:budget/features/home/data/models/pagination_model.dart';
import 'package:budget/features/auth/data/models/user_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final UserModel? user;
  final List<CarModel> activeCars;
  final List<CarModel> currentOffers;
  final List<CarModel> lastSeen;
  final PaginationModel? activeCarsPagination;
  final PaginationModel? currentOffersPagination;
  final PaginationModel? lastSeenPagination;

  const HomeLoaded({
    this.user,
    required this.activeCars,
    required this.currentOffers,
    required this.lastSeen,
    this.activeCarsPagination,
    this.currentOffersPagination,
    this.lastSeenPagination,
  });

  @override
  List<Object?> get props => [
        user,
        activeCars,
        currentOffers,
        lastSeen,
        activeCarsPagination,
        currentOffersPagination,
        lastSeenPagination,
      ];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
