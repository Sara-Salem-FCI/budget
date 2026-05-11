import 'package:budget/core/api/api_constants.dart';
import 'package:budget/features/notifications/data/models/notification_model.dart';
import 'package:dio/dio.dart';

abstract class NotificationRemoteDataSource {
  Future<NotificationResponseModel> getNotifications();
  Future<void> markAsRead(int notificationId);
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final Dio _dio;

  NotificationRemoteDataSourceImpl(this._dio);

  @override
  Future<NotificationResponseModel> getNotifications() async {
    final response = await _dio.get(ApiConstants.notifications);
    return NotificationResponseModel.fromJson(response.data);
  }

  @override
  Future<void> markAsRead(int notificationId) async {
    // Assuming there's an endpoint for this, e.g. provider/notifications/:id/read
    // If not specified in screenshots, we might just assume it's part of the flow
    await _dio.post('${ApiConstants.notifications}/$notificationId/read');
  }
}
