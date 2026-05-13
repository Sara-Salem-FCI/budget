import 'package:budget/core/api/api_constants.dart';
import 'package:budget/core/api/api_form_fields.dart';
import 'package:budget/features/profile/data/models/profile_api_envelope.dart';
import 'package:dio/dio.dart';

abstract class ProfileRemoteDataSource {
  /// Sends `notification` as `1` (on) or `0` (off) via multipart form-data.
  Future<ProfileApiEnvelope> toggleNotifications(bool enabled);

  /// Sends `lang` (e.g. `en`, `ar`) via multipart form-data.
  Future<ProfileApiEnvelope> updateLanguage(String languageCode);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio _dio;

  ProfileRemoteDataSourceImpl(this._dio);

  @override
  Future<ProfileApiEnvelope> toggleNotifications(bool enabled) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiConstants.userToggleNotification,
      data: FormData.fromMap({
        ApiFormFields.notification: enabled ? 1 : 0,
      }),
    );
    final data = response.data;
    if (data == null) {
      return const ProfileApiEnvelope(success: false, message: null);
    }
    return ProfileApiEnvelope.fromJson(data);
  }

  @override
  Future<ProfileApiEnvelope> updateLanguage(String languageCode) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiConstants.userChangeLanguage,
      data: FormData.fromMap({
        ApiFormFields.language: languageCode,
      }),
    );
    final data = response.data;
    if (data == null) {
      return const ProfileApiEnvelope(success: false, message: null);
    }
    return ProfileApiEnvelope.fromJson(data);
  }
}
