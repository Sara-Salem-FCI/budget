import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @app_title.
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get app_title;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @start_now.
  ///
  /// In en, this message translates to:
  /// **'Start Now'**
  String get start_now;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @onboarding_title_1.
  ///
  /// In en, this message translates to:
  /// **'Discover Cars Easily'**
  String get onboarding_title_1;

  /// No description provided for @onboarding_desc_1.
  ///
  /// In en, this message translates to:
  /// **'Browse a wide range of used cars from all brands and models, all in one place.'**
  String get onboarding_desc_1;

  /// No description provided for @onboarding_title_2.
  ///
  /// In en, this message translates to:
  /// **'Choose with Confidence'**
  String get onboarding_title_2;

  /// No description provided for @onboarding_desc_2.
  ///
  /// In en, this message translates to:
  /// **'See seller ratings, compare prices, and make sure you choose the deal that suits you.'**
  String get onboarding_desc_2;

  /// No description provided for @onboarding_title_3.
  ///
  /// In en, this message translates to:
  /// **'Buy Your Perfect Car'**
  String get onboarding_title_3;

  /// No description provided for @onboarding_desc_3.
  ///
  /// In en, this message translates to:
  /// **'Browse brands and models that suit you, and compare prices to choose the best deal with confidence.'**
  String get onboarding_desc_3;

  /// No description provided for @welcome_to_budget.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Budget!'**
  String get welcome_to_budget;

  /// No description provided for @budget_home.
  ///
  /// In en, this message translates to:
  /// **'Budget Home'**
  String get budget_home;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @welcome_back.
  ///
  /// In en, this message translates to:
  /// **'Welcome back!'**
  String get welcome_back;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get email;

  /// No description provided for @email_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get email_hint;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @password_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get password_hint;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgot_password;

  /// No description provided for @remember_me.
  ///
  /// In en, this message translates to:
  /// **'Remember Me'**
  String get remember_me;

  /// No description provided for @dont_have_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dont_have_account;

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get create_account;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get or;

  /// No description provided for @login_as_guest.
  ///
  /// In en, this message translates to:
  /// **'Enter as Guest'**
  String get login_as_guest;

  /// No description provided for @full_name.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get full_name;

  /// No description provided for @full_name_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get full_name_hint;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone_number;

  /// No description provided for @phone_number_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter phone number'**
  String get phone_number_hint;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm_password;

  /// No description provided for @confirm_password_hint.
  ///
  /// In en, this message translates to:
  /// **'Re-enter your password'**
  String get confirm_password_hint;

  /// No description provided for @agree_to_terms.
  ///
  /// In en, this message translates to:
  /// **'I agree to the '**
  String get agree_to_terms;

  /// No description provided for @terms_and_conditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get terms_and_conditions;

  /// No description provided for @already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get already_have_account;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @forgot_password_title.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgot_password_title;

  /// No description provided for @forgot_password_desc.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number. We will send you a code to reset your password'**
  String get forgot_password_desc;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @verification_code_title.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get verification_code_title;

  /// No description provided for @verification_code_desc.
  ///
  /// In en, this message translates to:
  /// **'Enter the verification code sent to your phone'**
  String get verification_code_desc;

  /// No description provided for @did_not_receive_code.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive code? '**
  String get did_not_receive_code;

  /// No description provided for @resend_code.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend_code;

  /// No description provided for @new_password_title.
  ///
  /// In en, this message translates to:
  /// **'Set New Password'**
  String get new_password_title;

  /// No description provided for @new_password_desc.
  ///
  /// In en, this message translates to:
  /// **'Add a new password to increase your account security'**
  String get new_password_desc;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @passwords_do_not_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwords_do_not_match;

  /// No description provided for @field_required.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get field_required;

  /// No description provided for @invalid_email.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address'**
  String get invalid_email;

  /// No description provided for @password_too_short.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get password_too_short;

  /// No description provided for @password_mixed_case.
  ///
  /// In en, this message translates to:
  /// **'Include both upper and lower case'**
  String get password_mixed_case;

  /// No description provided for @password_symbols.
  ///
  /// In en, this message translates to:
  /// **'Include at least one symbol'**
  String get password_symbols;

  /// No description provided for @session_expired.
  ///
  /// In en, this message translates to:
  /// **'Session expired, please try again'**
  String get session_expired;

  /// No description provided for @invalid_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number'**
  String get invalid_phone_number;

  /// No description provided for @error_connection_timeout.
  ///
  /// In en, this message translates to:
  /// **'Connection to server timed out'**
  String get error_connection_timeout;

  /// No description provided for @error_bad_response.
  ///
  /// In en, this message translates to:
  /// **'Server response error'**
  String get error_bad_response;

  /// No description provided for @error_request_cancelled.
  ///
  /// In en, this message translates to:
  /// **'Request was cancelled'**
  String get error_request_cancelled;

  /// No description provided for @error_no_internet.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get error_no_internet;

  /// No description provided for @error_unexpected_network.
  ///
  /// In en, this message translates to:
  /// **'An unexpected network error occurred'**
  String get error_unexpected_network;

  /// No description provided for @error_unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown error occurred'**
  String get error_unknown;

  /// No description provided for @error_unexpected.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred'**
  String get error_unexpected;

  /// No description provided for @welcome_name.
  ///
  /// In en, this message translates to:
  /// **'Welcome, {name}!'**
  String welcome_name(String name);

  /// No description provided for @home_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Search, compare, and choose your perfect car easily.'**
  String get home_subtitle;

  /// No description provided for @search_hint.
  ///
  /// In en, this message translates to:
  /// **'Search for your dream car......'**
  String get search_hint;

  /// No description provided for @current_offers.
  ///
  /// In en, this message translates to:
  /// **'Current Offers'**
  String get current_offers;

  /// No description provided for @available_cars.
  ///
  /// In en, this message translates to:
  /// **'Available Cars'**
  String get available_cars;

  /// No description provided for @recently_viewed.
  ///
  /// In en, this message translates to:
  /// **'Recently Viewed'**
  String get recently_viewed;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @show_details.
  ///
  /// In en, this message translates to:
  /// **'Show Details'**
  String get show_details;

  /// No description provided for @model_year.
  ///
  /// In en, this message translates to:
  /// **'Model {year}'**
  String model_year(int year);

  /// No description provided for @mileage_km.
  ///
  /// In en, this message translates to:
  /// **'{km} km'**
  String mileage_km(String km);

  /// No description provided for @nav_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get nav_home;

  /// No description provided for @nav_search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get nav_search;

  /// No description provided for @nav_favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get nav_favorites;

  /// No description provided for @nav_profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get nav_profile;

  /// No description provided for @must_agree_to_terms.
  ///
  /// In en, this message translates to:
  /// **'You must agree to the terms and conditions'**
  String get must_agree_to_terms;

  /// No description provided for @discount_label.
  ///
  /// In en, this message translates to:
  /// **'{percentage}% OFF'**
  String discount_label(int percentage);

  /// No description provided for @clear_all.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get clear_all;

  /// No description provided for @recent.
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get recent;

  /// No description provided for @suggested_cars.
  ///
  /// In en, this message translates to:
  /// **'Suggested cars for you'**
  String get suggested_cars;

  /// No description provided for @no_results.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get no_results;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @min_limit.
  ///
  /// In en, this message translates to:
  /// **'Min'**
  String get min_limit;

  /// No description provided for @max_limit.
  ///
  /// In en, this message translates to:
  /// **'Max'**
  String get max_limit;

  /// No description provided for @car_mileage.
  ///
  /// In en, this message translates to:
  /// **'Mileage'**
  String get car_mileage;

  /// No description provided for @km.
  ///
  /// In en, this message translates to:
  /// **'km'**
  String get km;

  /// No description provided for @sar.
  ///
  /// In en, this message translates to:
  /// **'SAR'**
  String get sar;

  /// No description provided for @brand.
  ///
  /// In en, this message translates to:
  /// **'Brand'**
  String get brand;

  /// No description provided for @fuel_type.
  ///
  /// In en, this message translates to:
  /// **'Fuel Type'**
  String get fuel_type;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @no_favorites_title.
  ///
  /// In en, this message translates to:
  /// **'No cars in favorites yet!'**
  String get no_favorites_title;

  /// No description provided for @no_favorites_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Add cars to your favorites to view them later'**
  String get no_favorites_subtitle;

  /// No description provided for @please_login.
  ///
  /// In en, this message translates to:
  /// **'Please login to continue'**
  String get please_login;

  /// No description provided for @search_favorites_hint.
  ///
  /// In en, this message translates to:
  /// **'Search for your dream car......'**
  String get search_favorites_hint;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @no_notifications_yet.
  ///
  /// In en, this message translates to:
  /// **'No notifications yet!'**
  String get no_notifications_yet;

  /// No description provided for @my_page.
  ///
  /// In en, this message translates to:
  /// **'My Page'**
  String get my_page;

  /// No description provided for @edit_profile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get edit_profile;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @terms_conditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get terms_conditions;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_policy;

  /// No description provided for @rate_us.
  ///
  /// In en, this message translates to:
  /// **'Rate Us'**
  String get rate_us;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @delete_account.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get delete_account;

  /// No description provided for @logout_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logout_confirmation;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
