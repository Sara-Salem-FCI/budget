// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_title => 'Budget';

  @override
  String get skip => 'Skip';

  @override
  String get next => 'Next';

  @override
  String get start_now => 'Start Now';

  @override
  String get arabic => 'Arabic';

  @override
  String get english => 'English';

  @override
  String get onboarding_title_1 => 'Discover Cars Easily';

  @override
  String get onboarding_desc_1 =>
      'Browse a wide range of used cars from all brands and models, all in one place.';

  @override
  String get onboarding_title_2 => 'Choose with Confidence';

  @override
  String get onboarding_desc_2 =>
      'See seller ratings, compare prices, and make sure you choose the deal that suits you.';

  @override
  String get onboarding_title_3 => 'Buy Your Perfect Car';

  @override
  String get onboarding_desc_3 =>
      'Browse brands and models that suit you, and compare prices to choose the best deal with confidence.';

  @override
  String get welcome_to_budget => 'Welcome to Budget!';

  @override
  String get budget_home => 'Budget Home';

  @override
  String get login => 'Login';

  @override
  String get welcome_back => 'Welcome back!';

  @override
  String get email => 'Email Address';

  @override
  String get email_hint => 'Enter your email';

  @override
  String get password => 'Password';

  @override
  String get password_hint => 'Enter your password';

  @override
  String get forgot_password => 'Forgot Password?';

  @override
  String get remember_me => 'Remember Me';

  @override
  String get dont_have_account => 'Don\'t have an account?';

  @override
  String get create_account => 'Create Account';

  @override
  String get or => 'OR';

  @override
  String get login_as_guest => 'Enter as Guest';

  @override
  String get full_name => 'Full Name';

  @override
  String get full_name_hint => 'Enter your full name';

  @override
  String get phone_number => 'Phone Number';

  @override
  String get phone_number_hint => 'Enter phone number';

  @override
  String get confirm_password => 'Confirm Password';

  @override
  String get confirm_password_hint => 'Re-enter your password';

  @override
  String get agree_to_terms => 'I agree to the ';

  @override
  String get terms_and_conditions => 'Terms and Conditions';

  @override
  String get already_have_account => 'Already have an account?';

  @override
  String get register => 'Register';

  @override
  String get forgot_password_title => 'Forgot Password';

  @override
  String get forgot_password_desc =>
      'Please enter your phone number. We will send you a code to reset your password';

  @override
  String get send => 'Send';

  @override
  String get verification_code_title => 'Verification Code';

  @override
  String get verification_code_desc =>
      'Enter the verification code sent to your phone';

  @override
  String get did_not_receive_code => 'Didn\'t receive code? ';

  @override
  String get resend_code => 'Resend';

  @override
  String get new_password_title => 'Set New Password';

  @override
  String get new_password_desc =>
      'Add a new password to increase your account security';

  @override
  String get save => 'Save';

  @override
  String get passwords_do_not_match => 'Passwords do not match';

  @override
  String get field_required => 'This field is required';

  @override
  String get invalid_email => 'Invalid email address';

  @override
  String get password_too_short => 'Password must be at least 8 characters';

  @override
  String get password_mixed_case => 'Include both upper and lower case';

  @override
  String get password_symbols => 'Include at least one symbol';

  @override
  String get session_expired => 'Session expired, please try again';

  @override
  String get invalid_phone_number => 'Invalid phone number';

  @override
  String get error_connection_timeout => 'Connection to server timed out';

  @override
  String get error_bad_response => 'Server response error';

  @override
  String get error_request_cancelled => 'Request was cancelled';

  @override
  String get error_no_internet => 'No internet connection';

  @override
  String get error_unexpected_network => 'An unexpected network error occurred';

  @override
  String get error_unknown => 'Unknown error occurred';

  @override
  String get error_unexpected => 'An unexpected error occurred';

  @override
  String welcome_name(String name) {
    return 'Welcome, $name!';
  }

  @override
  String get home_subtitle =>
      'Search, compare, and choose your perfect car easily.';

  @override
  String get search_hint => 'Search for your dream car......';

  @override
  String get current_offers => 'Current Offers';

  @override
  String get available_cars => 'Available Cars';

  @override
  String get recently_viewed => 'Recently Viewed';

  @override
  String get more => 'More';

  @override
  String get show_details => 'Show Details';

  @override
  String model_year(int year) {
    return 'Model $year';
  }

  @override
  String mileage_km(String km) {
    return '$km km';
  }

  @override
  String get nav_home => 'Home';

  @override
  String get nav_search => 'Search';

  @override
  String get nav_favorites => 'Favorites';

  @override
  String get nav_profile => 'Profile';

  @override
  String get must_agree_to_terms =>
      'You must agree to the terms and conditions';

  @override
  String discount_label(int percentage) {
    return '$percentage% OFF';
  }

  @override
  String get clear_all => 'Clear All';

  @override
  String get recent => 'Recent';

  @override
  String get suggested_cars => 'Suggested cars for you';

  @override
  String get no_results => 'No results found';

  @override
  String get filter => 'Filter';

  @override
  String get price => 'Price';

  @override
  String get min_limit => 'Min';

  @override
  String get max_limit => 'Max';

  @override
  String get car_mileage => 'Mileage';

  @override
  String get km => 'km';

  @override
  String get sar => 'SAR';

  @override
  String get brand => 'Brand';

  @override
  String get fuel_type => 'Fuel Type';

  @override
  String get reset => 'Reset';

  @override
  String get apply => 'Apply';

  @override
  String get favorites => 'Favorites';

  @override
  String get no_favorites_yet => 'No cars in favorites yet!';

  @override
  String get please_login => 'Please login to continue';

  @override
  String get search_favorites_hint => 'Search for your dream car......';
}
