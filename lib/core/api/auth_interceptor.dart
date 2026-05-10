import 'package:dio/dio.dart';
import 'package:budget/core/di/service_locator.dart';
import 'package:budget/features/auth/data/datasources/auth_local_data_source.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await getIt<AuthLocalDataSource>().getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }
}
