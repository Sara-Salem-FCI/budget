import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/auth_repository_impl.dart';

// --- Login States ---

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserModel user;
  const LoginSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class LoginError extends LoginState {
  final String message;
  const LoginError(this.message);

  @override
  List<Object?> get props => [message];
}

// --- Login Cubit ---

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _repository;

  LoginCubit(this._repository) : super(LoginInitial());

  // Form controllers
  final loginController = TextEditingController(); // email or phone
  final passwordController = TextEditingController();

  Future<void> login() async {
    emit(LoginLoading());

    final data = {
      'login': loginController.text,
      'password': passwordController.text,
      'fcm_token': 'mock_token',
    };

    final result = await _repository.login(data);

    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (user) => emit(LoginSuccess(user)),
    );
  }

  Future<void> guestLogin() async {
    emit(LoginLoading());

    final result = await _repository.guestLogin('55555');

    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (user) => emit(LoginSuccess(user)),
    );
  }

  @override
  Future<void> close() {
    loginController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
