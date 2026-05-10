import 'package:budget/core/api/api_constants.dart';

import 'package:budget/features/home/data/models/car_response_model.dart';
import 'package:dio/dio.dart';

abstract class HomeRemoteDataSource {
  Future<CarResponseModel> getActiveCars({int page = 1});
  Future<CarResponseModel> getCurrentOffers({int page = 1});
  Future<CarResponseModel> getLastSeen({int page = 1});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio _dio;

  HomeRemoteDataSourceImpl(this._dio);

  @override
  Future<CarResponseModel> getActiveCars({int page = 1}) async {
    final response = await _dio.get(
      ApiConstants.activeCars,
      queryParameters: {'page': page},
    );
    return CarResponseModel.fromJson(response.data);
  }

  @override
  Future<CarResponseModel> getCurrentOffers({int page = 1}) async {
    final response = await _dio.get(
      ApiConstants.currentOffers,
      queryParameters: {'page': page},
    );
    return CarResponseModel.fromJson(response.data);
  }

  @override
  Future<CarResponseModel> getLastSeen({int page = 1}) async {
    final response = await _dio.get(
      ApiConstants.lastSeen,
      queryParameters: {'page': page},
    );
    return CarResponseModel.fromJson(response.data);
  }
}
