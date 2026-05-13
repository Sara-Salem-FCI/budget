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
      loaded.copyWith(
        isNotificationToggleBusy: true,
        showNotificationToggleSuccess: false,
        clearNotificationToggleErrorMessage: true,
      ),
    );

    final result = await _profileRepository.setNotificationsEnabled(enabled);

    result.fold(
      (failure) {
        emit(
          loaded.copyWith(
            isNotificationToggleBusy: false,
            showNotificationToggleSuccess: false,
            notificationToggleErrorMessage: failure.message,
          ),
        );
      },
      (_) {
        emit(
          loaded.copyWith(
            user: user.copyWith(isNotify: enabled),
            isNotificationToggleBusy: false,
            showNotificationToggleSuccess: true,
            clearNotificationToggleErrorMessage: true,
          ),
        );
      },
    );
  }

  void clearNotificationFeedback() {
    if (state is! ProfileLoaded) return;
    final loaded = state as ProfileLoaded;
    emit(
      loaded.copyWith(
        showNotificationToggleSuccess: false,
        clearNotificationToggleErrorMessage: true,
      ),
    );
  }

  Future<void> deleteAccount() async {
    if (state is! ProfileLoaded) return;
    final loaded = state as ProfileLoaded;
    final user = loaded.user;
    if (user == null || loaded.isDeleteAccountBusy) return;

    emit(
      loaded.copyWith(
        isDeleteAccountBusy: true,
        clearDeleteAccountErrorMessage: true,
      ),
    );

    final result = await _authRepository.deleteAccount();

    result.fold(
      (failure) {
        emit(
          loaded.copyWith(
            isDeleteAccountBusy: false,
            deleteAccountErrorMessage: failure.message,
          ),
        );
      },
      (_) => emit(DeleteAccountSuccess()),
    );
  }

  void clearDeleteAccountFeedback() {
    if (state is! ProfileLoaded) return;
    final loaded = state as ProfileLoaded;
    emit(loaded.copyWith(clearDeleteAccountErrorMessage: true));
  }

  Future<void> logout() async {
    emit(LogoutLoading());
    await _authRepository.logout();
    emit(LogoutSuccess());
  }
}
