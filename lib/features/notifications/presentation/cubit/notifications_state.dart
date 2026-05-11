import 'package:equatable/equatable.dart';
import 'package:budget/features/notifications/data/models/notification_model.dart';

abstract class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object?> get props => [];
}

class NotificationsInitial extends NotificationsState {}

class NotificationsLoading extends NotificationsState {}

class NotificationsLoaded extends NotificationsState {
  final Map<String, List<NotificationModel>> groupedNotifications;

  const NotificationsLoaded({required this.groupedNotifications});

  @override
  List<Object?> get props => [groupedNotifications];
}

class NotificationsError extends NotificationsState {
  final String message;

  const NotificationsError(this.message);

  @override
  List<Object?> get props => [message];
}
