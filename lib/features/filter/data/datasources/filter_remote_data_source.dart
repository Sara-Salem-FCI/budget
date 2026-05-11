import 'package:budget/core/api/api_constants.dart';
import 'package:budget/features/filter/data/models/filter_options_model.dart';
import 'package:budget/features/filter/data/models/filter_request_model.dart';
import 'package:budget/features/home/data/models/car_response_model.dart';
import 'package:budget/features/search/data/models/search_history_model.dart';
import 'package:dio/dio.dart';

abstract class FilterRemoteDataSource {
  Future<FilterOptionsModel> getFilterOptions();
  Future<CarResponseModel> filterCars(FilterRequestModel request, {int page = 1});
  Future<CarResponseModel> filterByBrand(int brandId, {int page = 1});
  Future<SearchHistoryResponseModel> getSearchHistory();
  Future<CarResponseModel> getSearchHistoryResults(int historyId);
  Future<void> deleteSearchHistory(int historyId);
}

class FilterRemoteDataSourceImpl implements FilterRemoteDataSource {
  final Dio _dio;

  FilterRemoteDataSourceImpl(this._dio);

  @override
  Future<FilterOptionsModel> getFilterOptions() async {
    final response = await _dio.get(ApiConstants.filterOptions);
    return FilterOptionsModel.fromJson(response.data);
  }

  @override
  Future<CarResponseModel> filterCars(FilterRequestModel request, {int page = 1}) async {
    final queryParams = request.toQueryParameters();
    queryParams['page'] = page;

    final response = await _dio.get(
      ApiConstants.filter,
      queryParameters: queryParams,
    );
    return CarResponseModel.fromJson(response.data);
  }

  @override
  Future<CarResponseModel> filterByBrand(int brandId, {int page = 1}) async {
    final response = await _dio.get(
      '${ApiConstants.filterBrand}$brandId',
      queryParameters: {'page': page},
    );
    return CarResponseModel.fromJson(response.data);
  }

  @override
  Future<SearchHistoryResponseModel> getSearchHistory() async {
    final response = await _dio.get(ApiConstants.searchHistory);
    return SearchHistoryResponseModel.fromJson(response.data);
  }

  @override
  Future<CarResponseModel> getSearchHistoryResults(int historyId) async {
    final response = await _dio.get('${ApiConstants.searchHistory}/$historyId');
    return CarResponseModel.fromJson(response.data);
  }

  @override
  Future<void> deleteSearchHistory(int historyId) async {
    await _dio.delete('${ApiConstants.searchHistory}/$historyId');
  }
}
