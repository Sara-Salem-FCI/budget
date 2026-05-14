/// API constants for the application.
abstract class ApiConstants {
  static const String baseUrl = 'https://budget.pregnazone.com/api/';
  static const String register = 'auth/register';
  static const String login = 'auth/login';
  static const String forgotPassword = 'auth/forgot-password';
  static const String verifyCode = 'auth/verify-password-otp';
  static const String resetPassword = 'auth/reset-password';
  static const String sendOtp = 'auth/send-otp';
  static const String verificationOtp = 'auth/verification-otp';
  static const String verifyOtp = 'auth/verify-otp';
  static const String guest = 'auth/guest';
  static const String socialAuth = 'auth/social-auth';
  static const String logout = 'auth/logout';
  static const String updateProfile = 'auth/update-profile';
  static const String getProfile = 'auth/profile';


  // Apple Sign-In Config
  static const String appleClientId = 'com.example.budget.service';
  static const String appleRedirectUri = 'https://your-backend.com/callbacks/apple';

  // Home Endpoints
  static const String activeCars = 'main/active-cars';
  static const String currentOffers = 'main/current-offers';
  static const String lastSeen = 'main/last-seen';
  static const String searchCars = 'main/search';
  
  // Filter Endpoints
  static const String filterOptions = 'main/filter-options';
  static const String filter = 'main/filter';
  static const String filterBrand = 'main/filter-brand/';
  static const String userFavCars = 'user-fav-cars';
  static const String suggestCars = 'suggest-cars';
  static const String searchHistory = 'main/search-history';
  static const String notifications = 'user/notifications';
  static const String userToggleNotification = 'user/toggle-notification';
  static const String userChangeLanguage = 'user/lang';
  static const String userDeleteAccount = 'user/delete-account';
}

/// Header keys and values.
abstract class ApiHeaders {
  static const String contentType = 'Content-Type';
  static const String applicationJson = 'application/json';
  static const String accept = 'Accept';
  static const String authorization = 'Authorization';
}
