import 'package:dartz/dartz.dart';
import 'package:budget/core/error/failures.dart';
import 'package:budget/core/error/repo_error_handler.dart';
import 'package:budget/features/filter/data/datasources/filter_remote_data_source.dart';
import 'package:budget/features/filter/data/models/filter_options_model.dart';
import 'package:budget/features/filter/data/models/filter_request_model.dart';
import 'package:budget/features/home/data/models/car_response_model.dart';
import 'package:budget/features/search/data/models/search_history_model.dart';

abstract class FilterRepository {
  Future<Either<Failure, FilterOptionsModel>> getFilterOptions();
  Future<Either<Failure, CarResponseModel>> filterCars(FilterRequestModel request, {int page = 1});
  Future<Either<Failure, CarResponseModel>> filterByBrand(int brandId, {int page = 1});
  Future<Either<Failure, SearchHistoryResponseModel>> getSearchHistory();
  Future<Either<Failure, CarResponseModel>> getSearchHistoryResults(int historyId);
  Future<Either<Failure, void>> deleteSearchHistory(int historyId);
}

class FilterRepositoryImpl with RepoErrorHandler implements FilterRepository {
  final FilterRemoteDataSource _remoteDataSource;

  FilterRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, FilterOptionsModel>> getFilterOptions() async {
    return catchError(() => _remoteDataSource.getFilterOptions());
  }

  @override
  Future<Either<Failure, CarResponseModel>> filterCars(FilterRequestModel request, {int page = 1}) async {
    return catchError(() => _remoteDataSource.filterCars(request, page: page));
  }

  @override
  Future<Either<Failure, CarResponseModel>> filterByBrand(int brandId, {int page = 1}) async {
    return catchError(() => _remoteDataSource.filterByBrand(brandId, page: page));
  }

  @override
  Future<Either<Failure, SearchHistoryResponseModel>> getSearchHistory() async {
    return catchError(() => _remoteDataSource.getSearchHistory());
  }

  @override
  Future<Either<Failure, CarResponseModel>> getSearchHistoryResults(int historyId) async {
    return catchError(() => _remoteDataSource.getSearchHistoryResults(historyId));
  }

  @override
  Future<Either<Failure, void>> deleteSearchHistory(int historyId) async {
    return catchError(() => _remoteDataSource.deleteSearchHistory(historyId));
  }
}
