import 'package:budget/core/api/api_constants.dart';
import 'package:budget/features/home/data/models/car_response_model.dart';
import 'package:dio/dio.dart';

abstract class FavoritesRemoteDataSource {
  Future<CarResponseModel> getFavorites({int page = 1});
  Future<bool> toggleFavorite(int carId);
}

class FavoritesRemoteDataSourceImpl implements FavoritesRemoteDataSource {
  final Dio _dio;

  FavoritesRemoteDataSourceImpl(this._dio);

  @override
  Future<CarResponseModel> getFavorites({int page = 1}) async {
    final response = await _dio.get(
      ApiConstants.userFavCars,
      queryParameters: {'page': page},
    );
    return CarResponseModel.fromJson(response.data);
  }

  @override
  Future<bool> toggleFavorite(int carId) async {
    final response = await _dio.post(
      ApiConstants.userFavCars,
      data: FormData.fromMap({'car_id': carId}),
    );
    return response.data['success'] as bool? ?? false;
  }
}
