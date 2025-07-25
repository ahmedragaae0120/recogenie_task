part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginFailure extends AuthState {
  LoginFailure(this.error);
  final String error;
}

final class LoginLoading extends AuthState {}

final class SignupSuccess extends AuthState {}

final class SignupFailure extends AuthState {
  SignupFailure(this.error);
  final String error;
}

final class SignupLoading extends AuthState {}
