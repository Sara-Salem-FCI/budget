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
  String get no_favorites_title => 'No cars in favorites yet!';

  @override
  String get no_favorites_subtitle =>
      'Add cars to your favorites to view them later';

  @override
  String get please_login => 'Please login to continue';

  @override
  String get search_favorites_hint => 'Search for your dream car......';

  @override
  String get notifications => 'Notifications';

  @override
  String get notifications_toggle_success =>
      'Notification settings updated successfully';

  @override
  String get language_change_failed =>
      'Could not update language. Please try again.';

  @override
  String get no_notifications_yet => 'No notifications yet!';

  @override
  String get my_page => 'My Page';

  @override
  String get edit_profile => 'Edit Profile';

  @override
  String get language => 'Language';

  @override
  String get terms_conditions => 'Terms and Conditions';

  @override
  String get privacy_policy => 'Privacy Policy';

  @override
  String get rate_us => 'Rate Us';

  @override
  String get help => 'Help';

  @override
  String get logout => 'Logout';

  @override
  String get delete_account => 'Delete Account';

  @override
  String get logout_confirmation => 'Are you sure you want to logout?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get terms_intro =>
      'Welcome to Budget, a platform specialized in displaying, buying and selling cars and connecting sellers with buyers. By using the application, you acknowledge your full agreement to the terms and conditions mentioned below. Please read them carefully before using our services.';

  @override
  String get terms_section_1_title => '1. Acceptance of Terms';

  @override
  String get terms_section_1_desc =>
      'By using the app or creating an account, you fully agree to be bound by these terms. If you do not agree to any part of these terms, you must stop using the app immediately.';

  @override
  String get terms_section_2_title => '2. Eligibility';

  @override
  String get terms_section_2_item_1 =>
      'Users must be 18 years or older to use the application services.';

  @override
  String get terms_section_2_item_2 =>
      'The user is committed to providing correct and accurate information upon registration.';

  @override
  String get terms_section_2_item_3 =>
      'The user is responsible for maintaining the confidentiality of their account data and password.';

  @override
  String get terms_section_3_title => '3. Nature of Service';

  @override
  String get terms_section_3_item_1 =>
      'The app provides a platform for car listing and communication between buyer and seller and is not a party to the sale or purchase process.';

  @override
  String get terms_section_3_item_2 =>
      'The app is not responsible for inspecting cars or guaranteeing their quality or conformity to the displayed specifications.';

  @override
  String get terms_section_3_item_3 =>
      'Any agreement between the buyer and seller is outside the responsibility of the application.';

  @override
  String get terms_section_4_title => '4. Seller Obligations';

  @override
  String get terms_section_4_item_1 =>
      'Provide correct and clear information about the car.';

  @override
  String get terms_section_4_item_2 => 'Do not post stolen or illegal cars.';

  @override
  String get terms_section_4_item_3 =>
      'Commit to not manipulating prices or data or using misleading images.';

  @override
  String get terms_section_4_item_4 =>
      'Take full legal responsibility for the accuracy of the ad data.';

  @override
  String get terms_section_5_title => '5. Buyer Obligations';

  @override
  String get terms_section_5_item_1 =>
      'Verify the car condition before paying any amount.';

  @override
  String get terms_section_5_item_2 =>
      'Do not hold the application responsible for any fraud or dispute that occurs with the seller.';

  @override
  String get terms_section_5_item_3 =>
      'Commit to using the application legally without abuse.';

  @override
  String get terms_section_6_title => '6. Prohibited Activities';

  @override
  String get terms_section_6_prohibited => 'Users are prohibited from:';

  @override
  String get terms_section_6_p_item_1 => 'Posting misleading or incorrect ads';

  @override
  String get terms_section_6_p_item_2 => 'Using the app for scams or fraud';

  @override
  String get terms_section_6_p_item_3 =>
      'Posting content that violates laws or public morals';

  @override
  String get terms_section_6_p_item_4 => 'Abusing users or the support team';

  @override
  String get terms_section_6_p_item_5 => 'Using multiple accounts for evasion';

  @override
  String get terms_section_6_rights =>
      'In case of violation, the application has the right to:';

  @override
  String get terms_section_6_r_item_1 => 'Delete the ad';

  @override
  String get terms_section_6_r_item_2 =>
      'Suspend the account temporarily or permanently';

  @override
  String get terms_section_6_r_item_3 => 'Take necessary legal measures';

  @override
  String get terms_section_7_title => '7. Payment and Commissions';

  @override
  String get terms_section_7_item_1 =>
      'The app may charge fees for ads or premium services if clarified within the app.';

  @override
  String get terms_section_7_item_2 =>
      'All fees are non-refundable after payment.';

  @override
  String get terms_section_7_item_3 =>
      'The user bears any additional taxes or fees related to the service.';

  @override
  String get terms_section_8_title => '8. Disclaimer';

  @override
  String get terms_section_8_item_1 =>
      'The app is not responsible for the quality, accuracy or technical condition of the cars.';

  @override
  String get terms_section_8_item_2 =>
      'The app does not bear any financial losses or damages resulting from transactions between parties.';

  @override
  String get terms_section_8_item_3 =>
      'The user is responsible for verifying car papers and condition before purchase.';

  @override
  String get terms_section_9_title => '9. Amendments to Terms';

  @override
  String get terms_section_9_desc =>
      'The application management has the right to modify the terms at any time, and your continued use of the application after the update is considered an automatic agreement to the new modifications.';

  @override
  String get terms_section_10_title => '10. Intellectual Property';

  @override
  String get terms_section_10_desc =>
      'All application content (name, design, logos, images, codes) is owned by the application and may not be used or copied without official permission.';

  @override
  String get terms_section_11_title => '11. Termination of Service';

  @override
  String get terms_section_11_desc =>
      'The app has the right to stop or disable any account that violates usage policies without prior notice.';

  @override
  String get terms_section_12_title => '12. Governing Law';

  @override
  String get terms_section_12_desc =>
      'These terms are subject to the laws applicable in the Kingdom of Saudi Arabia.';

  @override
  String get legal_consent =>
      'By using the application, you agree to all the terms and conditions mentioned above.';

  @override
  String get privacy_intro =>
      'Welcome to Budget. We are committed to protecting your privacy and ensuring the security of your personal data. This Privacy Policy explains how we collect, use, protect, and disclose information when you use the app.';

  @override
  String get privacy_section_1_title => '1. Information We Collect';

  @override
  String get privacy_section_1_desc =>
      'We may collect the following information when using the application:';

  @override
  String get privacy_section_1_sub_a => 'A. Personal Information:';

  @override
  String get privacy_section_1_a_item_1 => 'Name';

  @override
  String get privacy_section_1_a_item_2 => 'Phone number';

  @override
  String get privacy_section_1_a_item_3 => 'Email address';

  @override
  String get privacy_section_1_a_item_4 => 'City or location';

  @override
  String get privacy_section_1_a_item_5 => 'Personal account information';

  @override
  String get privacy_section_1_sub_b => 'B. App Usage Information:';

  @override
  String get privacy_section_1_b_item_1 => 'Device type and operating system';

  @override
  String get privacy_section_1_b_item_2 => 'IP address';

  @override
  String get privacy_section_1_b_item_3 => 'Interaction history within the app';

  @override
  String get privacy_section_1_b_item_4 => 'Pages visited within the app';

  @override
  String get privacy_section_1_sub_c => 'C. Advertisement Data:';

  @override
  String get privacy_section_1_c_item_1 => 'Car photos uploaded by the user';

  @override
  String get privacy_section_1_c_item_2 =>
      'Car description, price and information';

  @override
  String get privacy_section_1_c_item_3 =>
      'Contact data included in the advertisement';

  @override
  String get privacy_section_2_title => '2. How We Use Information';

  @override
  String get privacy_section_2_desc => 'We use the collected data to:';

  @override
  String get privacy_section_2_item_1 =>
      'Improve user experience within the app';

  @override
  String get privacy_section_2_item_2 =>
      'Facilitate communication between buyer and seller';

  @override
  String get privacy_section_2_item_3 =>
      'Display ads appropriately and effectively';

  @override
  String get privacy_section_2_item_4 =>
      'Develop app services and fix technical issues';

  @override
  String get privacy_section_2_item_5 =>
      'Send notifications related to services or app updates';

  @override
  String get privacy_section_2_item_6 => 'Prevent fraud and abuse';

  @override
  String get privacy_section_3_title => '3. Information Sharing';

  @override
  String get privacy_section_3_desc =>
      'We do not sell personal data to any third party, but it may be shared in the following cases:';

  @override
  String get privacy_section_3_item_1 =>
      'With data analysis companies to improve performance';

  @override
  String get privacy_section_3_item_2 =>
      'With technical service providers (Support – Hosting – Notifications)';

  @override
  String get privacy_section_3_item_3 =>
      'If officially requested by the competent legal authorities';

  @override
  String get privacy_section_4_title => '4. Data Protection';

  @override
  String get privacy_section_4_desc =>
      'We use security measures and encryption techniques to protect user data such as:';

  @override
  String get privacy_section_4_item_1 => 'Encrypting sensitive data';

  @override
  String get privacy_section_4_item_2 => 'Protecting servers against hacking';

  @override
  String get privacy_section_4_item_3 =>
      'Periodic assessments of system vulnerabilities';

  @override
  String get privacy_section_4_footer =>
      'However, 100% protection cannot be guaranteed over the Internet.';

  @override
  String get privacy_section_5_title => '5. Cookies';

  @override
  String get privacy_section_5_desc =>
      'The app may use cookies to improve the experience such as:';

  @override
  String get privacy_section_5_item_1 => 'Save user preferences';

  @override
  String get privacy_section_5_item_2 => 'Performance analysis';

  @override
  String get privacy_section_5_item_3 =>
      'Personalize appropriate content for the user';

  @override
  String get privacy_section_5_footer =>
      'Users can disable them from browser settings if they wish.';

  @override
  String get privacy_section_6_title => '6. User Rights';

  @override
  String get privacy_section_6_desc => 'The user has the right to:';

  @override
  String get privacy_section_6_item_1 =>
      'Request deletion of their account and data';

  @override
  String get privacy_section_6_item_2 =>
      'Request modification of their personal data';

  @override
  String get privacy_section_6_item_3 =>
      'Object to receiving marketing messages or notifications';

  @override
  String get privacy_section_7_title => '7. User Responsibility';

  @override
  String get privacy_section_7_desc => 'The user is responsible for:';

  @override
  String get privacy_section_7_item_1 =>
      'Maintaining the confidentiality of their account data';

  @override
  String get privacy_section_7_item_2 =>
      'Any activity that takes place through their account';

  @override
  String get privacy_section_7_item_3 =>
      'Entering correct information upon registration';

  @override
  String get privacy_section_8_title => '8. Children\'s Privacy';

  @override
  String get privacy_section_8_desc =>
      'The app is not intended for persons under 18 years of age. In case of proof of use by a child under this age, the data will be deleted immediately.';

  @override
  String get privacy_section_9_title => '9. Amendments to Privacy Policy';

  @override
  String get privacy_section_9_desc =>
      'This policy may be updated from time to time, and in case of changes:';

  @override
  String get privacy_section_9_item_1 => 'Update the page';

  @override
  String get privacy_section_9_item_2 => 'Change the last update date';

  @override
  String get privacy_section_9_item_3 =>
      'Continued use of the app constitutes agreement to updates';

  @override
  String get riyadh => 'Riyadh';

  @override
  String get installment_starts_from => 'Monthly installment starts from:';

  @override
  String get transmission => 'Transmission';

  @override
  String get category_label => 'Category';

  @override
  String get details_tab => 'Details';

  @override
  String get description_tab => 'Description';

  @override
  String get engine_label => 'Engine';

  @override
  String get car_mileage_label => 'Mileage';

  @override
  String get car_condition_label => 'Condition';

  @override
  String get color_label => 'Color';

  @override
  String get showroom_name_label => 'Showroom';

  @override
  String get location_on_map => 'Location';

  @override
  String get call_button => 'Call';

  @override
  String get send_inquiry_button => 'Inquiry';

  @override
  String get automatic => 'Automatic';

  @override
  String get manual => 'Manual';

  @override
  String get standard => 'Standard';

  @override
  String get full => 'Full';

  @override
  String get used_condition => 'Used';

  @override
  String get new_condition => 'New';

  @override
  String get gasoline_fuel => 'Gasoline';

  @override
  String get diesel_fuel => 'Diesel';

  @override
  String get black_color => 'Black';

  @override
  String get white_color => 'White';

  @override
  String get model => 'Model';

  @override
  String get year_label => 'Year';
}
