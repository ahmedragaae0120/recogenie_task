import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:recogenie_task/core/result.dart';
import 'package:recogenie_task/domain/use_cases/login_usecase.dart';
import 'package:recogenie_task/domain/use_cases/register_usecase.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  @factoryMethod
  AuthCubit(this._loginUseCase, this._registerUsecase) : super(AuthInitial());
  final LoginUseCase _loginUseCase;
  final RegisterUsecase _registerUsecase;

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  login(String email, String password) async {
    emit(LoginLoading());
    final result = await _loginUseCase(email: email, password: password);

    switch (result) {
      case Success():
        emit(LoginSuccess());
        break;
      case Error():
        emit(LoginFailure(result.exception.toString()));
    }
  }

  register(String email, String password) async {
    emit(SignupLoading());
    final result = await _registerUsecase(email: email, password: password);

    switch (result) {
      case Success():
        emit(SignupSuccess());
        break;
      case Error():
        emit(SignupFailure(result.exception.toString()));
    }
  }
}
