import 'package:budget/core/constants/locale_storage_keys.dart';
import 'package:budget/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:budget/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<Locale> {
  final SharedPreferences _prefs;
  final ProfileRepository _profileRepository;
  final AuthRepository _authRepository;

  LocaleCubit(
    this._prefs,
    this._profileRepository,
    this._authRepository,
  ) : super(_loadInitialLocale(_prefs));

  static Locale _loadInitialLocale(SharedPreferences prefs) {
    final String? languageCode = prefs.getString(LocaleStorageKeys.appLocale);
    if (languageCode != null) {
      return Locale(languageCode);
    }
    return const Locale('ar');
  }

  /// Persists locale, updates UI, and syncs with backend when a user session exists.
  /// Returns `null` on success, or a failure message key / server string on failure.
  Future<String?> changeLanguage(String languageCode) async {
    if (state.languageCode == languageCode) {
      return null;
    }

    final token = await _authRepository.getToken();
    final user = await _authRepository.getUser();

    if (token != null && token.trim().isNotEmpty && user != null) {
      final result = await _profileRepository.updateUserLanguage(languageCode);
      return result.fold<Future<String?>>(
        (failure) async => failure.message,
        (_) async {
          await _prefs.setString(LocaleStorageKeys.appLocale, languageCode);
          emit(Locale(languageCode));
          return null;
        },
      );
    }

    await _prefs.setString(LocaleStorageKeys.appLocale, languageCode);
    emit(Locale(languageCode));
    return null;
  }
}
