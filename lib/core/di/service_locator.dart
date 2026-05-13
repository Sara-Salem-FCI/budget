import 'package:get_it/get_it.dart';
import 'package:budget/core/api/dio_factory.dart';
import 'package:budget/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:budget/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:budget/features/auth/presentation/cubit/register_cubit.dart';
import 'package:budget/features/auth/presentation/cubit/login_cubit.dart';
import 'package:budget/features/auth/presentation/cubit/forgot_password_cubit.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:budget/features/auth/data/datasources/auth_local_data_source.dart';

import 'package:budget/features/favorites/data/datasources/favorites_remote_data_source.dart';
import 'package:budget/features/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:budget/features/favorites/presentation/cubit/favorites_cubit.dart';

import 'package:budget/features/filter/data/datasources/filter_remote_data_source.dart';
import 'package:budget/features/filter/data/repositories/filter_repository_impl.dart';
import 'package:budget/features/filter/presentation/cubit/filter_cubit.dart';

import 'package:budget/features/home/data/datasources/home_remote_data_source.dart';
import 'package:budget/features/home/data/repositories/home_repository.dart';

import 'package:budget/features/home/presentation/cubit/home_cubit.dart';
import 'package:budget/features/search/presentation/cubit/search_cubit.dart';
import 'package:budget/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:budget/features/profile/data/repositories/profile_repository.dart';
import 'package:budget/features/profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:budget/features/profile/presentation/cubit/profile_cubit.dart';

import 'package:budget/features/notifications/data/datasources/notification_remote_data_source.dart';
import 'package:budget/features/notifications/data/repositories/notification_repository_impl.dart';
import 'package:budget/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:budget/core/cubit/locale_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Local Storage
  const secureStorage = FlutterSecureStorage();
  getIt.registerLazySingleton(() => secureStorage);

  final sharedPrefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPrefs);

  // Network (requires SharedPreferences for AcceptLanguageInterceptor)
  final dio = DioFactory.getDio(sharedPrefs);
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
  getIt.registerLazySingleton<FilterRemoteDataSource>(
    () => FilterRemoteDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<FavoritesRemoteDataSource>(
    () => FavoritesRemoteDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<NotificationRemoteDataSource>(
    () => NotificationRemoteDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt(), getIt()),
  );
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepository(getIt()),
  );
  getIt.registerLazySingleton<FilterRepository>(
    () => FilterRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      getIt<ProfileRemoteDataSource>(),
      getIt<AuthRepository>(),
    ),
  );

  // Cubits
  getIt.registerLazySingleton(() => RegisterCubit(getIt()));
  getIt.registerFactory(() => LoginCubit(getIt()));
  getIt.registerLazySingleton(() => ForgotPasswordCubit(getIt()));
  getIt.registerLazySingleton<HomeCubit>(
    () => HomeCubit(getIt(), getIt()),
  );
  getIt.registerFactory(() => SearchCubit(getIt(), getIt()));
  getIt.registerFactory(() => FilterCubit(getIt()));
  getIt.registerFactory(() => FavoritesCubit(getIt()));
  getIt.registerFactory(() => NotificationsCubit(getIt()));
  getIt.registerFactory(
    () => ProfileCubit(
      getIt<AuthRepository>(),
      getIt<ProfileRepository>(),
    ),
  );
  getIt.registerFactory<EditProfileCubit>(
    () => EditProfileCubit(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<LocaleCubit>(
    () => LocaleCubit(
      getIt<SharedPreferences>(),
      getIt<ProfileRepository>(),
      getIt<AuthRepository>(),
    ),
  );
}
