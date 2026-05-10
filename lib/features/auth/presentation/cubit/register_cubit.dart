import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/repositories/auth_repository_impl.dart';

// --- Register States ---

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String message;
  const RegisterSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class RegisterOtpVerifiedSuccess extends RegisterState {
  final Map<String, dynamic> response;
  const RegisterOtpVerifiedSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class RegisterError extends RegisterState {
  final String message;
  const RegisterError(this.message);

  @override
  List<Object?> get props => [message];
}

// --- Register Cubit ---

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _repository;

  RegisterCubit(this._repository) : super(RegisterInitial());

  // Form controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final otpController = TextEditingController();

  String _countryCode = '+966';
  String get fullPhone => '$_countryCode${phoneController.text}';

  void setCountryCode(String code) {
    _countryCode = code;
  }

  void clearOtp() {
    otpController.clear();
  }

  Future<void> register() async {
    emit(RegisterLoading());

    final data = {
      'name': nameController.text,
      'email': emailController.text,
      'phone': fullPhone,
      'password': passwordController.text,
      'password_confirmation': confirmPasswordController.text,
      'fcm_token': 'mock_token',
    };

    final result = await _repository.register(data);

    result.fold(
      (failure) => emit(RegisterError(failure.message)),
      (user) => emit(RegisterSuccess('Success')), // Default success message
    );
  }

  Future<void> resendOtp() async {
    clearOtp();
    await register();
  }

  Future<void> verifyOtp() async {
    emit(RegisterLoading());

    final data = {
      'type': 'register',
      'phone': fullPhone,
      'otp': otpController.text,
    };

    final result = await _repository.genericVerificationOtp(data);

    result.fold(
      (failure) => emit(RegisterError(failure.message)),
      (response) => emit(RegisterOtpVerifiedSuccess(response)),
    );
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    otpController.dispose();
    return super.close();
  }
}
