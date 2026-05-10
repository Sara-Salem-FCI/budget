import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'api_constants.dart';
import 'auth_interceptor.dart';

/// Factory for creating and configuring Dio instances.
class DioFactory {
  static Dio? _dio;

  static Dio getDio() {
    if (_dio != null) return _dio!;

    final dio = Dio()
      ..options = BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          ApiHeaders.contentType: ApiHeaders.applicationJson,
          ApiHeaders.accept: ApiHeaders.applicationJson,
          'accept-language': 'ar',
        },
      );

    // Add logging and auth interceptors
    dio.interceptors.addAll([
      AuthInterceptor(),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
      ),
    ]);

    _dio = dio;
    return dio;
  }
}
