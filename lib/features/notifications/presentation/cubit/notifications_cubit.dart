import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:budget/features/notifications/data/repositories/notification_repository_impl.dart';
import 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationRepository _repository;

  NotificationsCubit(this._repository) : super(NotificationsInitial());

  Future<void> getNotifications() async {
    // Only show loading if we haven't loaded before
    if (state is! NotificationsLoaded) {
      emit(NotificationsLoading());
    }
    
    final result = await _repository.getNotifications();
    
    result.fold(
      (failure) {
        if (state is! NotificationsLoaded) {
          emit(NotificationsError(failure.message));
        }
      },
      (response) => emit(NotificationsLoaded(
        groupedNotifications: response.groupedNotifications,
      )),
    );
  }

  Future<void> markAsRead(int id) async {
    // Silent update: mark as read then refresh background
    await _repository.markAsRead(id);
    await getNotifications();
  }
}
