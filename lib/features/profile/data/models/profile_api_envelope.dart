/// Common JSON envelope for profile user settings mutations (notifications, language, etc.).
class ProfileApiEnvelope {
  final bool success;
  final String? message;

  const ProfileApiEnvelope({
    required this.success,
    this.message,
  });

  factory ProfileApiEnvelope.fromJson(Map<String, dynamic> json) {
    return ProfileApiEnvelope(
      success: json['success'] as bool? ?? false,
      message: json['message']?.toString(),
    );
  }
}
