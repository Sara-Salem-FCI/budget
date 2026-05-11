import 'package:budget/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final AuthRepository _repository;

  ProfileCubit(this._repository) : super(ProfileInitial());

  Future<void> loadProfile() async {
    // Only show loading if we don't have user data yet
    if (state is! ProfileLoaded) {
      emit(ProfileLoading());
    }
    final user = await _repository.getUser();
    emit(ProfileLoaded(user));
  }

  Future<void> logout() async {
    emit(LogoutLoading());
    await _repository.logout();
    emit(LogoutSuccess());
  }
}
