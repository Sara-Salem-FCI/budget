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
  String get nav_profile => 'صفحتي';

  @override
  String get must_agree_to_terms => 'يجب الموافقة على الشروط والأحكام';

  @override
  String discount_label(int percentage) {
    return 'خصم $percentage%';
  }

  @override
  String get clear_all => 'مسح الكل';

  @override
  String get recent => 'مؤخرًا';

  @override
  String get suggested_cars => 'سيارات مقترحة لك';

  @override
  String get no_results => 'لا توجد نتائج';

  @override
  String get filter => 'فلتر';

  @override
  String get price => 'السعر';

  @override
  String get min_limit => 'الحد الأدنى';

  @override
  String get max_limit => 'الحد الأقصى';

  @override
  String get car_mileage => 'ممشى السيارة';

  @override
  String get km => 'كم';

  @override
  String get sar => 'ر.س';

  @override
  String get brand => 'الماركة';

  @override
  String get fuel_type => 'نوع الوقود';

  @override
  String get reset => 'إعادة ضبط';

  @override
  String get apply => 'تطبيق';

  @override
  String get favorites => 'المفضلة';

  @override
  String get no_favorites_title => 'لا يوجد سيارات في المفضلة بعد!';

  @override
  String get no_favorites_subtitle => 'أضف سيارات إلى المفضلة لعرضها لاحقاً';

  @override
  String get please_login => 'يرجى تسجيل الدخول للمتابعة';

  @override
  String get search_favorites_hint => 'ابحث عن سيارة احلامك......';

  @override
  String get notifications => 'الاشعارات';

  @override
  String get notifications_toggle_success => 'تم تحديث إعدادات الإشعارات بنجاح';

  @override
  String get language_change_failed =>
      'تعذر تحديث اللغة. يرجى المحاولة مرة أخرى.';

  @override
  String get no_notifications_yet => 'لا يوجد اشعارات حتي الان !';

  @override
  String get my_page => 'صفحتي';

  @override
  String get edit_profile => 'تعديل الصفحة الشخصية';

  @override
  String get language => 'اللغة';

  @override
  String get terms_conditions => 'الشروط والأحكام';

  @override
  String get privacy_policy => 'سياسة الخصوصية';

  @override
  String get rate_us => 'قيمنا';

  @override
  String get help => 'المساعدة';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get delete_account => 'حذف الحساب';

  @override
  String get logout_confirmation =>
      'هل أنت متأكد أنك تريد تسجيل الخروج بالفعل؟';

  @override
  String get yes => 'نعم';

  @override
  String get no => 'لا';

  @override
  String get terms_intro =>
      'مرحبًا بك في تطبيق بدجت، منصة مختصة بعرض وبيع وشراء السيارات وربط البائعين بالمشترين. باستخدامك للتطبيق فإنك تقر بموافقتك الكاملة على الشروط والأحكام المذكورة أدناه، يرجى قراءتها بعناية قبل استخدام خدماتنا.';

  @override
  String get terms_section_1_title => '1. قبول الشروط';

  @override
  String get terms_section_1_desc =>
      'باستخدامك للتطبيق أو إنشاء حساب عليه، فأنت توافق بشكل كامل على الالتزام ببنود هذه الشروط. وإذا كنت لا توافق على أي جزء من هذه الشروط، يجب عليك التوقف عن استخدام التطبيق فورًا.';

  @override
  String get terms_section_2_title => '2. أهلية الاستخدام';

  @override
  String get terms_section_2_item_1 =>
      'يجب أن يكون عمر المستخدم 18 عامًا أو أكثر لاستخدام خدمات التطبيق.';

  @override
  String get terms_section_2_item_2 =>
      'يلتزم المستخدم بتقديم معلومات صحيحة ودقيقة عند التسجيل.';

  @override
  String get terms_section_2_item_3 =>
      'يتحمل المستخدم مسؤولية الحفاظ على سرية بيانات حسابه وكلمة المرور.';

  @override
  String get terms_section_3_title => '3. طبيعة عمل التطبيق';

  @override
  String get terms_section_3_item_1 =>
      'التطبيق يوفر منصة لعرض السيارات والتواصل بين البائع والمشتري ولا يعتبر طرفًا في عملية البيع أو الشراء.';

  @override
  String get terms_section_3_item_2 =>
      'التطبيق غير مسؤول عن فحص السيارات أو ضمان جودتها أو مطابقتها للمواصفات المعروضة.';

  @override
  String get terms_section_3_item_3 =>
      'أي اتفاق يتم بين البائع والمشتري يتم خارج مسؤولية التطبيق.';

  @override
  String get terms_section_4_title => '4. التزامات البائع';

  @override
  String get terms_section_4_item_1 => 'تقديم معلومات صحيحة وواضحة عن السيارة.';

  @override
  String get terms_section_4_item_2 =>
      'عدم نشر سيارات مسروقة أو مخالفه للقوانين.';

  @override
  String get terms_section_4_item_3 =>
      'الالتزام بعدم التلاعب بالأسعار أو البيانات أو استخدام صور مضللة.';

  @override
  String get terms_section_4_item_4 =>
      'تحمل المسؤولية القانونية الكاملة عن صحة بيانات الإعلان.';

  @override
  String get terms_section_5_title => '5. التزامات المشتري';

  @override
  String get terms_section_5_item_1 =>
      'التأكد من حالة السيارة قبل دفع أي مبلغ.';

  @override
  String get terms_section_5_item_2 =>
      'عدم تحميل التطبيق مسؤولية أي عملية احتيال أو خلاف يحدث مع البائع.';

  @override
  String get terms_section_5_item_3 =>
      'الالتزام باستخدام التطبيق بشكل قانوني دون إساءة.';

  @override
  String get terms_section_6_title => '6. الممنوعات داخل التطبيق';

  @override
  String get terms_section_6_prohibited => 'يُحظر على المستخدمين:';

  @override
  String get terms_section_6_p_item_1 => 'نشر إعلانات مضللة أو غير صحيحة';

  @override
  String get terms_section_6_p_item_2 =>
      'استخدام التطبيق لعمليات نصب أو احتيال';

  @override
  String get terms_section_6_p_item_3 =>
      'نشر محتوى يخالف القوانين أو الآداب العامة';

  @override
  String get terms_section_6_p_item_4 => 'الإساءة للمستخدمين أو فريق الدعم';

  @override
  String get terms_section_6_p_item_5 => 'استخدام حسابات متعددة للتحايل';

  @override
  String get terms_section_6_rights => 'وفي حال المخالفة يحق للتطبيق:';

  @override
  String get terms_section_6_r_item_1 => 'حذف الإعلان';

  @override
  String get terms_section_6_r_item_2 => 'إيقاف الحساب مؤقتًا أو دائمًا';

  @override
  String get terms_section_6_r_item_3 => 'اتخاذ الإجراءات القانونية اللازمة';

  @override
  String get terms_section_7_title => '7. الدفع والعمولات (إن وجدت)';

  @override
  String get terms_section_7_item_1 =>
      'قد يفرض التطبيق رسومًا على الإعلانات أو الخدمات المميزة إن تم توضيحها داخل التطبيق.';

  @override
  String get terms_section_7_item_2 =>
      'جميع الرسوم غير قابلة للاسترداد بعد الدفع.';

  @override
  String get terms_section_7_item_3 =>
      'يتحمل المستخدم أي ضرائب أو رسوم إضافية متعلقة بالخدمة.';

  @override
  String get terms_section_8_title => '8. إخلاء المسؤولية';

  @override
  String get terms_section_8_item_1 =>
      'التطبيق غير مسؤول عن جودة السيارات أو دقتها أو حالتها الفنية.';

  @override
  String get terms_section_8_item_2 =>
      'لا يتحمل التطبيق أي خسائر مالية أو أضرار تنتج عن التعامل بين الأطراف.';

  @override
  String get terms_section_8_item_3 =>
      'المستخدم يتحمل مسؤولية التحقق من أوراق السيارة وحالتها قبل الشراء.';

  @override
  String get terms_section_9_title => '9. التعديلات على الشروط';

  @override
  String get terms_section_9_desc =>
      'يحق لإدارة التطبيق تعديل الشروط في أي وقت، ويعتبر استمرارك في استخدام التطبيق بعد التحديث موافقة تلقائية على التعديلات الجديدة.';

  @override
  String get terms_section_10_title => '10. الملكية الفكرية';

  @override
  String get terms_section_10_desc =>
      'جميع محتويات التطبيق (الاسم، التصميم، الشعارات، الصور، الأكواد) هي ملك للتطبيق ولا يُسمح باستخدامها أو نسخها دون إذن رسمي.';

  @override
  String get terms_section_11_title => '11. إنهاء الخدمة';

  @override
  String get terms_section_11_desc =>
      'يحق للتطبيق إيقاف أو تعطيل أي حساب يخالف سياسات الاستخدام دون إشعار مسبق.';

  @override
  String get terms_section_12_title => '12. القانون المعمول به';

  @override
  String get terms_section_12_desc =>
      'تخضع هذه الشروط للقوانين المعمول بها في المملكة العربية السعودية، وأي نزاع يتم الفصل فيه لدى الجهات القانونية المختصة داخل الدولة.';

  @override
  String get legal_consent =>
      'باستخدامك للتطبيق فأنت توافق على جميع الشروط والأحكام المذكورة أعلاه.';

  @override
  String get privacy_intro =>
      'نرحب بكم في تطبيق بدجت، نحن نلتزم بحماية خصوصيتك وضمان أمان بياناتك الشخصية. توضح سياسة الخصوصية هذه كيفية جمع المعلومات، استخدامها، حمايتها، والإفصاح عنها عند استخدامك للتطبيق.';

  @override
  String get privacy_section_1_title => '1. المعلومات التي نقوم بجمعها';

  @override
  String get privacy_section_1_desc =>
      'قد نقوم بجمع المعلومات التالية عند استخدام التطبيق:';

  @override
  String get privacy_section_1_sub_a => 'أ. المعلومات الشخصية:';

  @override
  String get privacy_section_1_a_item_1 => 'الاسم';

  @override
  String get privacy_section_1_a_item_2 => 'رقم الهاتف';

  @override
  String get privacy_section_1_a_item_3 => 'البريد الإلكتروني';

  @override
  String get privacy_section_1_a_item_4 => 'المدينة أو الموقع';

  @override
  String get privacy_section_1_a_item_5 => 'معلومات الحساب الشخصي';

  @override
  String get privacy_section_1_sub_b => 'ب. معلومات متعلقة باستخدام التطبيق:';

  @override
  String get privacy_section_1_b_item_1 => 'نوع الجهاز ونظام التشغيل';

  @override
  String get privacy_section_1_b_item_2 => 'عنوان الـ IP';

  @override
  String get privacy_section_1_b_item_3 => 'سجل التفاعل داخل التطبيق';

  @override
  String get privacy_section_1_b_item_4 =>
      'الصفحات التي تمت زيارتها داخل التطبيق';

  @override
  String get privacy_section_1_sub_c => 'ج. بيانات الإعلان (إن وُجدت):';

  @override
  String get privacy_section_1_c_item_1 => 'صور السيارات المرفوعة من المستخدم';

  @override
  String get privacy_section_1_c_item_2 => 'وصف السيارة وسعرها ومعلوماتها';

  @override
  String get privacy_section_1_c_item_3 =>
      'بيانات التواصل التي يتم إدراجها داخل الإعلان';

  @override
  String get privacy_section_2_title => '2. كيفية استخدام المعلومات';

  @override
  String get privacy_section_2_desc => 'نستخدم البيانات التي تم جمعها بهدف:';

  @override
  String get privacy_section_2_item_1 => 'تحسين تجربة المستخدم داخل التطبيق';

  @override
  String get privacy_section_2_item_2 => 'تسهيل التواصل بين البائع والمشتري';

  @override
  String get privacy_section_2_item_3 => 'عرض الإعلانات بشكل مناسب وفعّال';

  @override
  String get privacy_section_2_item_4 =>
      'تطوير خدمات التطبيق وإصلاح المشكلات التقنية';

  @override
  String get privacy_section_2_item_5 =>
      'إرسال إشعارات متعلقة بالخدمات أو تحديثات التطبيق';

  @override
  String get privacy_section_2_item_6 => 'منع الاحتيال وإساءة الاستخدام';

  @override
  String get privacy_section_3_title => '3. مشاركة المعلومات مع جهات خارجية';

  @override
  String get privacy_section_3_desc =>
      'نحن لا نقوم ببيع البيانات الشخصية لأي طرف ثالث، ولكن قد يتم مشاركتها في الحالات التالية فقط:';

  @override
  String get privacy_section_3_item_1 =>
      'مع شركات تحليل البيانات لتحسين الأداء';

  @override
  String get privacy_section_3_item_2 =>
      'مع مزودي الخدمات التقنية (الدعم – الاستضافة – الإشعارات)';

  @override
  String get privacy_section_3_item_3 =>
      'إذا طُلب ذلك رسميًا من الجهات القانونية المختصة';

  @override
  String get privacy_section_4_title => '4. حماية البيانات';

  @override
  String get privacy_section_4_desc =>
      'نستخدم تدابير أمنية وتقنيات تشفير لحماية بيانات المستخدم مثل:';

  @override
  String get privacy_section_4_item_1 => 'تشفير البيانات الحساسة';

  @override
  String get privacy_section_4_item_2 => 'حماية الخوادم ضد الاختراق';

  @override
  String get privacy_section_4_item_3 => 'تقييمات دورية لثغرات النظام';

  @override
  String get privacy_section_4_footer =>
      'ومع ذلك، لا يمكن ضمان الحماية الكاملة بنسبة 100% عبر الإنترنت.';

  @override
  String get privacy_section_5_title => '5. ملفات تعريف الارتباط (Cookies)';

  @override
  String get privacy_section_5_desc =>
      'قد يستخدم التطبيق ملفات تعريف الارتباط لتحسين التجربة مثل:';

  @override
  String get privacy_section_5_item_1 => 'حفظ تفضيلات المستخدم';

  @override
  String get privacy_section_5_item_2 => 'تحليل الأداء';

  @override
  String get privacy_section_5_item_3 => 'تخصيص المحتوى المناسب للمستخدم';

  @override
  String get privacy_section_5_footer =>
      'ويمكن للمستخدم تعطيلها من إعدادات المتصفح إن رغب.';

  @override
  String get privacy_section_6_title => '6. حقوق المستخدم';

  @override
  String get privacy_section_6_desc => 'يحق للمستخدم:';

  @override
  String get privacy_section_6_item_1 => 'طلب حذف حسابه وبياناته من التطبيق';

  @override
  String get privacy_section_6_item_2 => 'طلب تعديل بياناته الشخصية';

  @override
  String get privacy_section_6_item_3 =>
      'الاعتراض على تلقي رسائل تسويقية أو إشعارات';

  @override
  String get privacy_section_7_title => '7. مسؤولية المستخدم';

  @override
  String get privacy_section_7_desc => 'المستخدم مسؤول عن:';

  @override
  String get privacy_section_7_item_1 => 'الحفاظ على سرية بيانات حسابه';

  @override
  String get privacy_section_7_item_2 =>
      'أي نشاط يتم من خلال حسابه داخل التطبيق';

  @override
  String get privacy_section_7_item_3 =>
      'إدخال معلومات صحيحة عند التسجيل أو نشر الإعلانات';

  @override
  String get privacy_section_8_title => '8. استخدام الأطفال للتطبيق';

  @override
  String get privacy_section_8_desc =>
      'التطبيق غير مخصص للأشخاص دون سن 18 عامًا، وفي حال ثبوت استخدام طفل دون هذا السن، يتم حذف البيانات فورًا.';

  @override
  String get privacy_section_9_title => '9. التعديلات على سياسة الخصوصية';

  @override
  String get privacy_section_9_desc =>
      'قد يتم تحديث هذه السياسة من وقت لآخر، وفي حال إجراء تغييرات سيتم:';

  @override
  String get privacy_section_9_item_1 => 'تحديث الصفحة';

  @override
  String get privacy_section_9_item_2 => 'تغيير تاريخ آخر تحديث';

  @override
  String get privacy_section_9_item_3 =>
      'الاستمرار في استخدام التطبيق يعتبر موافقة على التحديثات';

  @override
  String get riyadh => 'الرياض';

  @override
  String get installment_starts_from => 'قسط شهري يبدأ من:';

  @override
  String get transmission => 'ناقل الحركة';

  @override
  String get category_label => 'الفئة';

  @override
  String get details_tab => 'تفاصيل';

  @override
  String get description_tab => 'وصف';

  @override
  String get engine_label => 'المحرك';

  @override
  String get car_mileage_label => 'المسافة المقطوعة';

  @override
  String get car_condition_label => 'حالة السيارة';

  @override
  String get color_label => 'اللون';

  @override
  String get showroom_name_label => 'اسم المعرض';

  @override
  String get location_on_map => 'الموقع';

  @override
  String get call_button => 'اتصال';

  @override
  String get send_inquiry_button => 'أرسل استفسارك';

  @override
  String get automatic => 'أوتوماتيك';

  @override
  String get manual => 'يدوي';

  @override
  String get standard => 'ستاندر';

  @override
  String get full => 'فل كامل';

  @override
  String get used_condition => 'مستعملة';

  @override
  String get new_condition => 'جديدة';

  @override
  String get gasoline_fuel => 'بنزين';

  @override
  String get diesel_fuel => 'ديزل';

  @override
  String get black_color => 'اسود';

  @override
  String get white_color => 'ابيض';

  @override
  String get model => 'الموديل';

  @override
  String get year_label => 'سنة الصنع';
}
