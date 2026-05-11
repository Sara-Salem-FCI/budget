import 'package:dio/dio.dart';
import 'package:budget/core/di/service_locator.dart';
import 'package:budget/features/auth/data/datasources/auth_local_data_source.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // List of public endpoints that don't need a token
    const publicPaths = [
      'auth/login',
      'auth/register',
      'auth/forgot-password',
      'auth/verify-password-otp',
      'auth/reset-password',
      'auth/send-otp',
      'auth/verification-otp',
      'auth/verify-otp',
      'auth/guest',
      'auth/social-auth',
    ];

    if (publicPaths.any((path) => options.path.endsWith(path))) {
      return handler.next(options);
    }

    final token = await getIt<AuthLocalDataSource>().getToken();
    if (token != null && token.trim().isNotEmpty) {
      options.headers['Authorization'] = 'Bearer ${token.trim()}';
    }
    
    return handler.next(options);
  }
}
