import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:budget/core/api/api_constants.dart';
import 'package:budget/core/error/failures.dart';
import 'package:budget/core/error/repo_error_handler.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/user_model.dart';
import '../datasources/auth_local_data_source.dart';

/// Repository interface for authentication-related data operations.
abstract class AuthRepository {
  Future<Either<Failure, UserModel>> register(Map<String, dynamic> data);
  Future<Either<Failure, UserModel>> login(Map<String, dynamic> data);
  Future<Either<Failure, Map<String, dynamic>>> forgotPassword(Map<String, dynamic> data);
  Future<Either<Failure, Map<String, dynamic>>> verifyCode(Map<String, dynamic> data);
  Future<Either<Failure, Map<String, dynamic>>> resetPassword(Map<String, dynamic> data);
  Future<Either<Failure, Map<String, dynamic>>> sendOtp(Map<String, dynamic> data);
  Future<Either<Failure, Map<String, dynamic>>> genericVerificationOtp(Map<String, dynamic> data);
  Future<Either<Failure, Map<String, dynamic>>> verifyOtp(Map<String, dynamic> data);
  Future<Either<Failure, UserModel>> guestLogin(String fcmToken);
  Future<Either<Failure, UserModel>> socialAuth(String uid, String fcmToken);
  Future<void> logout();
  Future<String?> getToken();
  Future<UserModel?> getUser();
  Future<void> setOnboardingVisited();
  Future<bool> isOnboardingVisited();
  /// Persists an updated user snapshot (e.g. after profile settings change).
  Future<void> cacheUser(UserModel user);
  Future<Either<Failure, Unit>> deleteAccount();
  Future<Either<Failure, UserModel>> fetchProfile();


  Future<Either<Failure, UserModel>> updateProfile({
    required UserModel currentUser,
    required String name,
    required String email,
    String? imageFilePath,
  });
}

/// Implementation of [AuthRepository].
class AuthRepositoryImpl with RepoErrorHandler implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, UserModel>> register(Map<String, dynamic> data) async {
    final result = await catchError(() => _remoteDataSource.register(data));
    return result.fold(
      (failure) async => Left(failure),
      (user) async {
        if (user.token != null) {
          await _localDataSource.saveToken(user.token!);
          await _localDataSource.saveUserId(user.id);
          await _localDataSource.saveUserData(jsonEncode(user.toJson()));
          await _localDataSource.saveBaseUrl(ApiConstants.baseUrl);
        }
        return Right(user);
      },
    );

  }

  @override
  Future<Either<Failure, UserModel>> login(Map<String, dynamic> data) async {
    final result = await catchError(() => _remoteDataSource.login(data));
    return result.fold(
      (failure) async => Left(failure),
      (user) async {
        if (user.token != null) {
          await _localDataSource.saveToken(user.token!);
          await _localDataSource.saveUserId(user.id);
          await _localDataSource.saveUserData(jsonEncode(user.toJson()));
          await _localDataSource.saveBaseUrl(ApiConstants.baseUrl);
        }
        return Right(user);
      },
    );

  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> forgotPassword(Map<String, dynamic> data) =>
      catchError(() => _remoteDataSource.forgotPassword(data));

  @override
  Future<Either<Failure, Map<String, dynamic>>> verifyCode(Map<String, dynamic> data) =>
      catchError(() => _remoteDataSource.verifyCode(data));

  @override
  Future<Either<Failure, Map<String, dynamic>>> resetPassword(Map<String, dynamic> data) =>
      catchError(() => _remoteDataSource.resetPassword(data));

  @override
  Future<Either<Failure, Map<String, dynamic>>> sendOtp(Map<String, dynamic> data) =>
      catchError(() => _remoteDataSource.sendOtp(data));

  @override
  Future<Either<Failure, Map<String, dynamic>>> genericVerificationOtp(Map<String, dynamic> data) async {
    final result = await catchError(() => _remoteDataSource.genericVerificationOtp(data));
    return result.fold(
      (failure) async => Left(failure),
      (response) async {
        final token = response['data']?['token'];
        final userData = response['data']?['user'];
        if (token != null) await _localDataSource.saveToken(token);
        if (userData != null) {
          final user = UserModel.fromJson(userData);
          await _localDataSource.saveUserId(user.id);
          await _localDataSource.saveUserData(jsonEncode(userData));
          await _localDataSource.saveBaseUrl(ApiConstants.baseUrl);
        }
        return Right(response);
      },
    );

  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> verifyOtp(Map<String, dynamic> data) async {
    final result = await catchError(() => _remoteDataSource.verifyOtp(data));
    return result.fold(
      (failure) async => Left(failure),
      (response) async {
        final token = response['data']?['token'];
        final userData = response['data']?['user'];
        if (token != null) await _localDataSource.saveToken(token);
        if (userData != null) {
          final user = UserModel.fromJson(userData);
          await _localDataSource.saveUserId(user.id);
          await _localDataSource.saveUserData(jsonEncode(userData));
          await _localDataSource.saveBaseUrl(ApiConstants.baseUrl);
        }
        return Right(response);
      },
    );

  }

  @override
  Future<void> logout() async {
    try {
      await _remoteDataSource.logout();
    } catch (_) {
      // Even if remote logout fails, we clear local session
    }
    await _localDataSource.deleteToken();
  }

  @override
  Future<String?> getToken() => _localDataSource.getToken();

  @override
  Future<UserModel?> getUser() async {
    final userData = await _localDataSource.getUserData();
    if (userData == null) return null;
    return UserModel.fromJson(jsonDecode(userData));
  }

  @override
  Future<void> setOnboardingVisited() => _localDataSource.saveOnboardingVisited(true);

  @override
  Future<bool> isOnboardingVisited() => _localDataSource.isOnboardingVisited();

  @override
  Future<void> cacheUser(UserModel user) async {
    await _localDataSource.saveUserData(jsonEncode(user.toJson()));
  }

  @override
  Future<Either<Failure, Unit>> deleteAccount() async {
    final result = await catchError(() => _remoteDataSource.deleteAccount());
    return result.fold<Future<Either<Failure, Unit>>>(
      (failure) async => Left(failure),
      (_) async {
        await _localDataSource.deleteToken();
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, UserModel>> fetchProfile() async {
    final currentUser = await getUser();
    if (currentUser == null) {
      return const Left(ServerFailure('error_not_authenticated'));
    }


    final result = await catchError(() => _remoteDataSource.getProfile(currentUser));
    return result.fold(
      (failure) async => Left(failure),
      (user) async {
        await _localDataSource.saveUserData(jsonEncode(user.toJson()));
        return Right(user);
      },
    );

  }




  @override
  Future<Either<Failure, UserModel>> updateProfile({
    required UserModel currentUser,
    required String name,
    required String email,
    String? imageFilePath,
  }) async {
    final result = await catchError(
      () => _remoteDataSource.updateProfile(
        currentUser: currentUser,
        name: name,
        email: email,
        imageFilePath: imageFilePath,
      ),
    );
    return result.fold(
      (failure) async => Left(failure),
      (user) async {
        await _localDataSource.saveUserData(jsonEncode(user.toJson()));
        return Right(user);
      },
    );
  }

  @override
  Future<Either<Failure, UserModel>> guestLogin(String fcmToken) async {
    final result = await catchError(() => _remoteDataSource.guestLogin(fcmToken));
    return result.fold(
      (failure) async => Left(failure),
      (user) async {
        if (user.token != null) {
          await _localDataSource.saveToken(user.token!);
          await _localDataSource.saveUserId(user.id);
          await _localDataSource.saveUserData(jsonEncode(user.toJson()));
          await _localDataSource.saveBaseUrl(ApiConstants.baseUrl);
        }
        return Right(user);
      },
    );

  }

  @override
  Future<Either<Failure, UserModel>> socialAuth(String uid, String fcmToken) async {
    final result = await catchError(() => _remoteDataSource.socialAuth(uid, fcmToken));
    return result.fold(
      (failure) async => Left(failure),
      (user) async {
        if (user.token != null) {
          await _localDataSource.saveToken(user.token!);
          await _localDataSource.saveUserId(user.id);
          await _localDataSource.saveUserData(jsonEncode(user.toJson()));
          await _localDataSource.saveBaseUrl(ApiConstants.baseUrl);
        }
        return Right(user);
      },
    );

  }
}
