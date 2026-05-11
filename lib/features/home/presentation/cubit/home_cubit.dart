import 'package:dartz/dartz.dart';
import 'package:budget/core/error/failures.dart';
import 'package:budget/features/home/data/models/car_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:budget/features/home/data/repositories/home_repository.dart';
import 'package:budget/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:budget/features/home/presentation/cubit/home_state.dart';
import 'package:budget/features/auth/data/models/user_model.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _repository;
  final AuthRepository _authRepository;

  HomeCubit(this._repository, this._authRepository) : super(HomeInitial());

  Future<void> fetchHomeData() async {
    // If we already have data, don't show loading indicator
    if (state is! HomeLoaded) {
      emit(HomeLoading());
    }

    // Fetch user and home data concurrently
    final results = await Future.wait([
      _repository.getActiveCars(),
      _repository.getCurrentOffers(),
      _repository.getLastSeen(),
      _authRepository.getUser(),
    ]);

    final activeCarsResult = results[0] as Either<Failure, CarResponseModel>;
    final currentOffersResult = results[1] as Either<Failure, CarResponseModel>;
    final lastSeenResult = results[2] as Either<Failure, CarResponseModel>;
    final user = results[3] as UserModel?;

    activeCarsResult.fold(
      (failure) {
        if (state is! HomeLoaded) {
          emit(HomeError(failure.message));
        }
      },
      (activeCarsRes) {
        final currentOffersRes = currentOffersResult.fold((l) => null, (r) => r);
        final lastSeenRes = lastSeenResult.fold((l) => null, (r) => r);

        emit(HomeLoaded(
          user: user,
          activeCars: activeCarsRes.cars,
          activeCarsPagination: activeCarsRes.pagination,
          currentOffers: currentOffersRes?.cars ?? [],
          currentOffersPagination: currentOffersRes?.pagination,
          lastSeen: lastSeenRes?.cars ?? [],
          lastSeenPagination: lastSeenRes?.pagination,
        ));
      },
    );
  }
}
