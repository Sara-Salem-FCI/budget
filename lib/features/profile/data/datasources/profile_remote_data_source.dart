import 'package:budget/core/api/api_constants.dart';
import 'package:budget/core/api/api_form_fields.dart';
import 'package:budget/features/profile/data/models/toggle_notification_result.dart';
import 'package:dio/dio.dart';

abstract class ProfileRemoteDataSource {
  /// Sends `notification` as `1` (on) or `0` (off) via multipart form-data.
  Future<ToggleNotificationResult> toggleNotifications(bool enabled);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio _dio;

  ProfileRemoteDataSourceImpl(this._dio);

  @override
  Future<ToggleNotificationResult> toggleNotifications(bool enabled) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiConstants.userToggleNotification,
      data: FormData.fromMap({
        ApiFormFields.notification: enabled ? 1 : 0,
      }),
    );
    final data = response.data;
    if (data == null) {
      return const ToggleNotificationResult(success: false, message: null);
    }
    return ToggleNotificationResult.fromJson(data);
  }
}
