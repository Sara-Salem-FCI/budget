import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:budget/l10n/app_localizations.dart';
import '../../data/repositories/auth_repository_impl.dart';

// --- Forgot Password States ---

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object?> get props => [];
}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordSentSuccess extends ForgotPasswordState {
  final String message;
  const ForgotPasswordSentSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class VerificationSuccess extends ForgotPasswordState {
  final String message;
  const VerificationSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class ResetPasswordSuccess extends ForgotPasswordState {
  final String message;
  const ResetPasswordSuccess(this.message);

  @override
  List<Object?> get props => [message];
}
// get storage

class ForgotPasswordError extends ForgotPasswordState {
  final String message;
  const ForgotPasswordError(this.message);

  @override
  List<Object?> get props => [message];
}

// --- Forgot Password Cubit ---

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepository _repository;

  ForgotPasswordCubit(this._repository) : super(ForgotPasswordInitial());

  // Controllers
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String? _resetToken;
  String _countryCode = '+966';
  String get phone => '$_countryCode${phoneController.text}';

  void setCountryCode(String code) {
    _countryCode = code;
  }

  void clearOtp() {
    otpController.clear();
  }

  Future<void> sendCode() async {
    emit(ForgotPasswordLoading());
    final result = await _repository.sendOtp({'phone': phone});
    result.fold(
      (failure) => emit(ForgotPasswordError(failure.message)),
      (response) => emit(ForgotPasswordSentSuccess(response['message'] ?? 'Code sent')),
    );
  }

  Future<void> resendCode() async {
    clearOtp();
    await sendCode();
  }

  Future<void> verifyCode() async {
    emit(ForgotPasswordLoading());
    final data = {
      'type': 'password',
      'phone': phone,
      'otp': otpController.text,
    };
    final result = await _repository.genericVerificationOtp(data);
    result.fold(
      (failure) => emit(ForgotPasswordError(failure.message)),
      (response) {
        _resetToken = response['data']?['reset_token'];
        emit(VerificationSuccess(response['message'] ?? 'Verified'));
      },
    );
  }

  Future<void> resetPassword(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    
    if (passwordController.text != confirmPasswordController.text) {
      emit(ForgotPasswordError(l10n.passwords_do_not_match));
      return;
    }

    if (_resetToken == null) {
      emit(ForgotPasswordError(l10n.session_expired));
      return;
    }

    emit(ForgotPasswordLoading());
    final data = {
      'phone': phone,
      'otp': otpController.text,
      'reset_token': _resetToken!,
      'password': passwordController.text,
      'password_confirmation': confirmPasswordController.text,
    };
    final result = await _repository.resetPassword(data);
    result.fold(
      (failure) => emit(ForgotPasswordError(failure.message)),
      (response) => emit(ResetPasswordSuccess(response['message'] ?? 'Success')),
    );
  }

  @override
  Future<void> close() {
    phoneController.dispose();
    otpController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
