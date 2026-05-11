import 'package:budget/core/error/failures.dart';
import 'package:budget/core/error/repo_error_handler.dart';
import 'package:budget/features/favorites/data/datasources/favorites_remote_data_source.dart';
import 'package:budget/features/home/data/models/car_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, CarResponseModel>> getFavorites({int page = 1});
  Future<Either<Failure, bool>> toggleFavorite(int carId);
}

class FavoritesRepositoryImpl with RepoErrorHandler implements FavoritesRepository {
  final FavoritesRemoteDataSource _remoteDataSource;

  FavoritesRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, CarResponseModel>> getFavorites({int page = 1}) async {
    return catchError(() => _remoteDataSource.getFavorites(page: page));
  }

  @override
  Future<Either<Failure, bool>> toggleFavorite(int carId) async {
    return catchError(() => _remoteDataSource.toggleFavorite(carId));
  }
}
