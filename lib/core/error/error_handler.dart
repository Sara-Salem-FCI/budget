import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:budget/l10n/app_localizations.dart';

/// Handles API errors and returns localized messages.
class ErrorHandler {
  static String handle(dynamic error, BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return l10n.error_connection_timeout;
        case DioExceptionType.badResponse:
          final responseData = error.response?.data;
          if (responseData is Map) {
            if (responseData.containsKey('errors')) {
              final errors = responseData['errors'] as Map;
              if (errors.isNotEmpty) {
                final firstErrorList = errors.values.first;
                if (firstErrorList is List &&
                    firstErrorList.isNotEmpty) {
                  return firstErrorList.first.toString();
                }
              }
            }
            final message = responseData['message'];
            if (message != null) return message.toString();
          }
          return l10n.error_bad_response;
        case DioExceptionType.cancel:
          return l10n.error_request_cancelled;
        case DioExceptionType.connectionError:
          return l10n.error_no_internet;
        default:
          return l10n.error_unexpected_network;
      }
    }
    return error.toString();
  }
}
