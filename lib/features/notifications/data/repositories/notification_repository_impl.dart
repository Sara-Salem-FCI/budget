import 'package:dartz/dartz.dart';
import 'package:budget/core/error/failures.dart';
import 'package:budget/core/error/repo_error_handler.dart';
import 'package:budget/features/notifications/data/datasources/notification_remote_data_source.dart';
import 'package:budget/features/notifications/data/models/notification_model.dart';

abstract class NotificationRepository {
  Future<Either<Failure, NotificationResponseModel>> getNotifications();
  Future<Either<Failure, void>> markAsRead(int notificationId);
}

class NotificationRepositoryImpl with RepoErrorHandler implements NotificationRepository {
  final NotificationRemoteDataSource _remoteDataSource;

  NotificationRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, NotificationResponseModel>> getNotifications() async {
    return catchError(() => _remoteDataSource.getNotifications());
  }

  @override
  Future<Either<Failure, void>> markAsRead(int notificationId) async {
    return catchError(() => _remoteDataSource.markAsRead(notificationId));
  }
}
