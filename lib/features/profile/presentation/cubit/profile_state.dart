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

  const ProfileLoaded(
    this.user, {
    this.isNotificationToggleBusy = false,
    this.showNotificationToggleSuccess = false,
    this.notificationToggleErrorMessage,
  });

  @override
  List<Object?> get props => [
        user,
        isNotificationToggleBusy,
        showNotificationToggleSuccess,
        notificationToggleErrorMessage,
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
