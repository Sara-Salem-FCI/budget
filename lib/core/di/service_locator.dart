import 'package:get_it/get_it.dart';
import 'package:budget/core/api/dio_factory.dart';
import 'package:budget/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:budget/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:budget/features/auth/presentation/cubit/register_cubit.dart';
import 'package:budget/features/auth/presentation/cubit/login_cubit.dart';
import 'package:budget/features/auth/presentation/cubit/forgot_password_cubit.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:budget/features/auth/data/datasources/auth_local_data_source.dart';

import 'package:budget/features/home/data/datasources/home_remote_data_source.dart';
import 'package:budget/features/home/data/repositories/home_repository.dart';

import 'package:budget/features/home/presentation/cubit/home_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Local Storage
  const secureStorage = FlutterSecureStorage();
  getIt.registerLazySingleton(() => secureStorage);

  // Network
  final dio = DioFactory.getDio();
  getIt.registerLazySingleton(() => dio);

  // Data Sources
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt(), getIt()),
  );
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepository(getIt()),
  );

  // Cubits
  getIt.registerLazySingleton(() => RegisterCubit(getIt()));
  getIt.registerFactory(() => LoginCubit(getIt()));
  getIt.registerLazySingleton(() => ForgotPasswordCubit(getIt()));
  getIt.registerFactory(() => HomeCubit(getIt(), getIt()));
}
