/// Parsed API envelope for [ApiConstants.userToggleNotification].
class ToggleNotificationResult {
  final bool success;
  final String? message;

  const ToggleNotificationResult({
    required this.success,
    this.message,
  });

  factory ToggleNotificationResult.fromJson(Map<String, dynamic> json) {
    return ToggleNotificationResult(
      success: json['success'] as bool? ?? false,
      message: json['message']?.toString(),
    );
  }
}
