import 'package:budget/features/auth/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object?> get props => [];
}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileNoSession extends EditProfileState {}

class EditProfileReady extends EditProfileState {
  final UserModel user;
  final String? pickedImagePath;
  final bool isSaving;
  final String? errorMessage;

  const EditProfileReady(
    this.user, {
    this.pickedImagePath,
    this.isSaving = false,
    this.errorMessage,
  });

  EditProfileReady copyWith({
    UserModel? user,
    String? pickedImagePath,
    bool clearPickedImage = false,
    bool? isSaving,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return EditProfileReady(
      user ?? this.user,
      pickedImagePath: clearPickedImage
          ? null
          : (pickedImagePath ?? this.pickedImagePath),
      isSaving: isSaving ?? this.isSaving,
      errorMessage: clearErrorMessage
          ? null
          : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  List<Object?> get props => [
        user,
        pickedImagePath,
        isSaving,
        errorMessage,
      ];
}

class EditProfileSuccess extends EditProfileState {
  final UserModel user;

  const EditProfileSuccess(this.user);

  @override
  List<Object?> get props => [user];
}
