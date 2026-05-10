// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get app_title => 'Budget';

  @override
  String get skip => 'تخطي';

  @override
  String get next => 'التالي';

  @override
  String get start_now => 'ابدأ الآن';

  @override
  String get arabic => 'العربية';

  @override
  String get english => 'الإنجليزية';

  @override
  String get onboarding_title_1 => 'اكتشف السيارات بكل سهولة';

  @override
  String get onboarding_desc_1 =>
      'تصفح مجموعة كبيرة من السيارات المستعملة من كل الماركات والموديلات وكلها في مكان واحد.';

  @override
  String get onboarding_title_2 => 'اختر اللي يناسبك بثقة';

  @override
  String get onboarding_desc_2 =>
      'شوف تقييمات البائعين، وقارن الأسعار، وتأكد إنك تختار الصفقة اللي تناسبك.';

  @override
  String get onboarding_title_3 => 'اشتر سيارتك المثالية بسهولة';

  @override
  String get onboarding_desc_3 =>
      'تصفح الماركات والموديلات اللي تناسبك، وقارن الأسعار عشان تختار أفضل صفقة بثقة.';

  @override
  String get welcome_to_budget => 'مرحباً بكم في Budget!';

  @override
  String get budget_home => 'الرئيسية';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get welcome_back => 'مرحبًا بعودتك من جديد!';

  @override
  String get email => 'البريد الالكتروني';

  @override
  String get email_hint => 'ادخل بريدك الالكتروني';

  @override
  String get password => 'كلمة السر';

  @override
  String get password_hint => 'ادخل كلمة السر';

  @override
  String get forgot_password => 'نسيت كلمة السر؟';

  @override
  String get remember_me => 'تذكرني';

  @override
  String get dont_have_account => 'ليس لديك حساب ؟';

  @override
  String get create_account => 'انشاء حساب';

  @override
  String get or => 'أو';

  @override
  String get login_as_guest => 'الدخول كضيف';

  @override
  String get full_name => 'الاسم بالكامل';

  @override
  String get full_name_hint => 'ادخل اسمك بالكامل';

  @override
  String get phone_number => 'رقم الهاتف';

  @override
  String get phone_number_hint => 'ادخل رقم الهاتف';

  @override
  String get confirm_password => 'تأكيد كلمة السر';

  @override
  String get confirm_password_hint => 'اعد ادخال كلمة السر';

  @override
  String get agree_to_terms => 'الموافقة على ';

  @override
  String get terms_and_conditions => 'الشروط والاحكام';

  @override
  String get already_have_account => 'لديك حساب بالفعل؟';

  @override
  String get register => 'إنشاء حساب';

  @override
  String get forgot_password_title => 'نسيت كلمة السر';

  @override
  String get forgot_password_desc =>
      'الرجاء إدخال رقم هاتفك. سوف نرسل لك رمزًا إلى رقمك لإعادة تعيين كلمة المرور';

  @override
  String get send => 'ارسال';

  @override
  String get verification_code_title => 'رمز التحقق';

  @override
  String get verification_code_desc =>
      'ادخل رمز التحقق الذي تم ارساله لرقم هاتفك';

  @override
  String get did_not_receive_code => 'لم تستلم الرمز؟ ';

  @override
  String get resend_code => 'أعد الإرسال';

  @override
  String get new_password_title => 'تعيين كلمة سر جديدة';

  @override
  String get new_password_desc => 'اضف كلمة سر جديده لزيادة امان حسابك';

  @override
  String get save => 'حفظ';

  @override
  String get passwords_do_not_match => 'كلمات المرور غير متطابقة';

  @override
  String get field_required => 'هذا الحقل مطلوب';

  @override
  String get invalid_email => 'بريد إلكتروني غير صالح';

  @override
  String get password_too_short => 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';

  @override
  String get password_mixed_case => 'يجب أن تحتوي على أحرف كبيرة وصغيرة';

  @override
  String get password_symbols => 'يجب أن تحتوي على رموز (!@#\$)';

  @override
  String get session_expired => 'انتهت صلاحية الجلسة، حاول مرة أخرى';

  @override
  String get invalid_phone_number => 'رقم الهاتف غير صحيح';

  @override
  String get error_connection_timeout => 'انتهت مهلة الاتصال بالخادم';

  @override
  String get error_bad_response => 'خطأ في استجابة الخادم';

  @override
  String get error_request_cancelled => 'تم إلغاء الطلب';

  @override
  String get error_no_internet => 'لا يوجد اتصال بالإنترنت';

  @override
  String get error_unexpected_network => 'حدث خطأ غير متوقع في الشبكة';

  @override
  String get error_unknown => 'حدث خطأ غير معروف';

  @override
  String get error_unexpected => 'حدث خطأ غير متوقع';

  @override
  String welcome_name(String name) {
    return 'مرحبا، $name !';
  }

  @override
  String get home_subtitle => 'ابحث، قارن، واختر سيارتك المثالية بسهولة.';

  @override
  String get search_hint => 'ابحث عن سيارة احلامك......';

  @override
  String get current_offers => 'العروض الحالية';

  @override
  String get available_cars => 'السيارات متاحة';

  @override
  String get recently_viewed => 'المشاهدة حديثاً';

  @override
  String get more => 'المزيد';

  @override
  String get show_details => 'عرض التفاصيل';

  @override
  String model_year(int year) {
    return 'موديل $year';
  }

  @override
  String mileage_km(String km) {
    return '$km كم';
  }

  @override
  String get nav_home => 'الرئيسية';

  @override
  String get nav_search => 'البحث';

  @override
  String get nav_favorites => 'المفضلة';

  @override
  String get nav_profile => 'حسابي';

  @override
  String get must_agree_to_terms => 'يجب الموافقة على الشروط والأحكام';

  @override
  String discount_label(int percentage) {
    return 'خصم $percentage%';
  }
}
