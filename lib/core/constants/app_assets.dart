/// Centralized asset management for the application.
abstract class AppAssets {
  static const String _basePath = 'assets/images/';
  
  /// The main logo of the application.
  static const String logo = '${_basePath}logo.svg';
  static const String logoAr = '${_basePath}logo_ar.svg';

  /// Onboarding illustrations.
  static const String onboarding1 = '${_basePath}onboarding1.svg';
  static const String onboarding2 = '${_basePath}onboarding2.svg';
  static const String onboarding3 = '${_basePath}onboarding3.svg';
  
  /// The background frame for onboarding illustrations.
  static const String onboardingFrame = '${_basePath}onboarding_frame.svg';

  /// Social authentication icons.
  static const String google = '${_basePath}google.svg';
  static const String apple = '${_basePath}apple.svg';
  
  /// Empty state images
  static const String noNotifications = '${_basePath}no_notifications.svg';
  static const String noFavorites = '${_basePath}no_fav.png';
}
