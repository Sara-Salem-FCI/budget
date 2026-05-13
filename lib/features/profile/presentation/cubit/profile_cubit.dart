import 'package:budget/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:budget/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final AuthRepository _authRepository;
  final ProfileRepository _profileRepository;

  ProfileCubit(this._authRepository, this._profileRepository)
      : super(ProfileInitial());

  Future<void> loadProfile() async {
    if (state is! ProfileLoaded) {
      emit(ProfileLoading());
    }
    final user = await _authRepository.getUser();
    emit(ProfileLoaded(user));
  }

  Future<void> setNotificationsEnabled(bool enabled) async {
    if (state is! ProfileLoaded) return;
    final loaded = state as ProfileLoaded;
    final user = loaded.user;
    if (user == null || loaded.isNotificationToggleBusy) return;
    if (user.isNotify == enabled) return;

    emit(
      ProfileLoaded(
        loaded.user,
        isNotificationToggleBusy: true,
        showNotificationToggleSuccess: false,
        notificationToggleErrorMessage: null,
      ),
    );

    final result = await _profileRepository.setNotificationsEnabled(enabled);

    result.fold(
      (failure) {
        emit(
          ProfileLoaded(
            loaded.user,
            isNotificationToggleBusy: false,
            showNotificationToggleSuccess: false,
            notificationToggleErrorMessage: failure.message,
          ),
        );
      },
      (_) {
        emit(
          ProfileLoaded(
            user.copyWith(isNotify: enabled),
            isNotificationToggleBusy: false,
            showNotificationToggleSuccess: true,
            notificationToggleErrorMessage: null,
          ),
        );
      },
    );
  }

  void clearNotificationFeedback() {
    if (state is! ProfileLoaded) return;
    final loaded = state as ProfileLoaded;
    emit(
      ProfileLoaded(
        loaded.user,
        isNotificationToggleBusy: loaded.isNotificationToggleBusy,
        showNotificationToggleSuccess: false,
        notificationToggleErrorMessage: null,
      ),
    );
  }

  Future<void> logout() async {
    emit(LogoutLoading());
    await _authRepository.logout();
    emit(LogoutSuccess());
  }
}
