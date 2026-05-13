/// Reusable form field names for API requests (multipart / url-encoded).
abstract class ApiFormFields {
  /// Toggle push notifications: `1` = enabled, `0` = disabled.
  static const String notification = 'notification';

  /// User interface language code (e.g. `en`, `ar`).
  static const String language = 'lang';

  /// Update profile (multipart).
  static const String profileName = 'name';
  static const String profileEmail = 'email';
  static const String profileImage = 'profile_image';
}
