import 'package:budget/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final AuthRepository _authRepository;

  EditProfileCubit(this._authRepository) : super(EditProfileInitial());

  Future<void> load() async {
    emit(EditProfileLoading());
    final user = await _authRepository.getUser();
    if (user == null) {
      emit(EditProfileNoSession());
      return;
    }
    emit(EditProfileReady(user));
  }

  void setPickedImagePath(String? path) {
    if (state is! EditProfileReady) return;
    final ready = state as EditProfileReady;
    emit(
      ready.copyWith(
        pickedImagePath: path,
        clearPickedImage: path == null,
        clearErrorMessage: true,
      ),
    );
  }

  Future<void> submit({
    required String name,
    required String email,
  }) async {
    if (state is! EditProfileReady) return;
    final ready = state as EditProfileReady;
    if (ready.isSaving) return;

    emit(ready.copyWith(isSaving: true, clearErrorMessage: true));

    final result = await _authRepository.updateProfile(
      currentUser: ready.user,
      name: name.trim(),
      email: email.trim(),
      imageFilePath: ready.pickedImagePath,
    );

    result.fold(
      (failure) {
        emit(
          ready.copyWith(
            isSaving: false,
            errorMessage: failure.message,
          ),
        );
      },
      (user) => emit(EditProfileSuccess(user)),
    );
  }
}
