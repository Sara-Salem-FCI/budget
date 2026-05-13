import 'package:budget/core/error/failures.dart';
import 'package:budget/core/error/repo_error_handler.dart';
import 'package:budget/features/auth/data/models/user_model.dart';
import 'package:budget/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:budget/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  /// Updates notification preference on the server and refreshes the cached user.
  Future<Either<Failure, Unit>> setNotificationsEnabled(bool enabled);
}

class ProfileRepositoryImpl with RepoErrorHandler implements ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;
  final AuthRepository _authRepository;

  ProfileRepositoryImpl(this._remoteDataSource, this._authRepository);

  @override
  Future<Either<Failure, Unit>> setNotificationsEnabled(bool enabled) async {
    final result = await catchError(
      () => _remoteDataSource.toggleNotifications(enabled),
    );

    return result.fold<Future<Either<Failure, Unit>>>(
      (failure) async => Left(failure),
      (toggleResult) async {
        if (!toggleResult.success) {
          return Left(
            ServerFailure(toggleResult.message ?? 'error_bad_response'),
          );
        }
        final UserModel? user = await _authRepository.getUser();
        if (user != null) {
          await _authRepository.cacheUser(user.copyWith(isNotify: enabled));
        }
        return const Right(unit);
      },
    );
  }
}
