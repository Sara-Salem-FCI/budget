class NotificationResponseModel {
  final bool success;
  final int statusCode;
  final String message;
  final Map<String, List<NotificationModel>> groupedNotifications;

  NotificationResponseModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.groupedNotifications,
  });

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    final dynamic rawNotifications = json['data']?['notifications'];
    final Map<String, List<NotificationModel>> grouped = {};

    if (rawNotifications is Map) {
      rawNotifications.forEach((day, list) {
        if (list is List) {
          grouped[day.toString()] = list
              .map((item) => NotificationModel.fromJson(item))
              .toList();
        }
      });
    } else if (rawNotifications is List) {
      if (rawNotifications.isNotEmpty) {
        grouped['Notifications'] = rawNotifications
            .map((item) => NotificationModel.fromJson(item))
            .toList();
      }
    }

    return NotificationResponseModel(
      success: json['success'] ?? false,
      statusCode: json['status_code'] ?? 0,
      message: json['message'] ?? '',
      groupedNotifications: grouped,
    );
  }
}

class NotificationModel {
  final int id;
  final String title;
  final String message;
  final String time;
  final String? readAt;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.time,
    this.readAt,
  });

  bool get isRead => readAt != null;

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      title: json['title'] ?? '',
      message: json['message'] ?? '',
      time: json['time'] ?? '',
      readAt: json['read_at'],
    );
  }
}
