import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:budget/core/error/failures.dart';

/// Mixin for repositories to handle errors consistently.
///
/// Uses localization key identifiers in failure messages.
/// The presentation layer resolves these keys to localized
/// strings via [FailureLocalizer].
mixin RepoErrorHandler {
  Future<Either<Failure, T>> catchError<T>(
      Future<T> Function() call) async {
    try {
      final response = await call();
      return Right(response);
    } on DioException catch (e) {
      String message;
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          message = 'error_connection_timeout';
          break;
        case DioExceptionType.badResponse:
          final data = e.response?.data;
          if (data is Map) {
            // If the server returns a localized message, use it
            if (data.containsKey('errors')) {
              final errors = data['errors'] as Map;
              if (errors.isNotEmpty) {
                final firstErrorList = errors.values.first;
                if (firstErrorList is List &&
                    firstErrorList.isNotEmpty) {
                  return Left(
                    ServerFailure(
                      firstErrorList.first.toString(),
                    ),
                  );
                }
              }
            }
            final serverMessage = data['message'];
            if (serverMessage != null) {
              return Left(ServerFailure(serverMessage.toString()));
            }
          }
          message = 'error_bad_response';
          break;
        case DioExceptionType.connectionError:
          message = 'error_no_internet';
          break;
        default:
          message = 'error_unexpected_network';
      }
      return Left(ServerFailure(message));
    } catch (e) {
      return const Left(UnexpectedFailure('error_unexpected'));
    }
  }
}
