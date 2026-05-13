import 'package:budget/core/constants/locale_storage_keys.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Sets `accept-language` on each request from persisted app locale.
class AcceptLanguageInterceptor extends Interceptor {
  final SharedPreferences _prefs;

  AcceptLanguageInterceptor(this._prefs);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final lang = _prefs.getString(LocaleStorageKeys.appLocale) ?? 'ar';
    options.headers['accept-language'] = lang;
    handler.next(options);
  }
}
