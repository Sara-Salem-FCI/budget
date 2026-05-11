import 'package:dartz/dartz.dart';
import 'package:budget/core/error/failures.dart';
import 'package:budget/core/error/repo_error_handler.dart';
import 'package:budget/features/home/data/datasources/home_remote_data_source.dart';
import 'package:budget/features/home/data/models/car_response_model.dart';

class HomeRepository with RepoErrorHandler {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepository(this._remoteDataSource);

  Future<Either<Failure, CarResponseModel>> getActiveCars({int page = 1}) async {
    return catchError(() => _remoteDataSource.getActiveCars(page: page));
  }

  Future<Either<Failure, CarResponseModel>> getCurrentOffers({int page = 1}) async {
    return catchError(() => _remoteDataSource.getCurrentOffers(page: page));
  }

  Future<Either<Failure, CarResponseModel>> getLastSeen({int page = 1}) async {
    return catchError(() => _remoteDataSource.getLastSeen(page: page));
  }

  Future<Either<Failure, CarResponseModel>> searchCars({
    required String query,
    int page = 1,
  }) async {
    return catchError(
      () => _remoteDataSource.searchCars(query: query, page: page),
    );
  }

  Future<Either<Failure, CarResponseModel>> getSuggestedCars({int page = 1}) async {
    return catchError(() => _remoteDataSource.getSuggestedCars(page: page));
  }
}
