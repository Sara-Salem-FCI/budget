import 'package:budget/features/auth/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserModel? user;
  final bool isNotificationToggleBusy;
  final bool showNotificationToggleSuccess;
  final String? notificationToggleErrorMessage;
  final bool isDeleteAccountBusy;
  final String? deleteAccountErrorMessage;

  const ProfileLoaded(
    this.user, {
    this.isNotificationToggleBusy = false,
    this.showNotificationToggleSuccess = false,
    this.notificationToggleErrorMessage,
    this.isDeleteAccountBusy = false,
    this.deleteAccountErrorMessage,
  });

  ProfileLoaded copyWith({
    UserModel? user,
    bool? isNotificationToggleBusy,
    bool? showNotificationToggleSuccess,
    String? notificationToggleErrorMessage,
    bool? isDeleteAccountBusy,
    String? deleteAccountErrorMessage,
    bool clearNotificationToggleErrorMessage = false,
    bool clearDeleteAccountErrorMessage = false,
  }) {
    return ProfileLoaded(
      user ?? this.user,
      isNotificationToggleBusy:
          isNotificationToggleBusy ?? this.isNotificationToggleBusy,
      showNotificationToggleSuccess:
          showNotificationToggleSuccess ?? this.showNotificationToggleSuccess,
      notificationToggleErrorMessage: clearNotificationToggleErrorMessage
          ? null
          : (notificationToggleErrorMessage ??
              this.notificationToggleErrorMessage),
      isDeleteAccountBusy: isDeleteAccountBusy ?? this.isDeleteAccountBusy,
      deleteAccountErrorMessage: clearDeleteAccountErrorMessage
          ? null
          : (deleteAccountErrorMessage ?? this.deleteAccountErrorMessage),
    );
  }

  @override
  List<Object?> get props => [
        user,
        isNotificationToggleBusy,
        showNotificationToggleSuccess,
        notificationToggleErrorMessage,
        isDeleteAccountBusy,
        deleteAccountErrorMessage,
      ];
}

class ProfileError extends ProfileState {
  final String message;
  const ProfileError(this.message);

  @override
  List<Object?> get props => [message];
}

class LogoutLoading extends ProfileState {}

class LogoutSuccess extends ProfileState {}

class DeleteAccountSuccess extends ProfileState {}
