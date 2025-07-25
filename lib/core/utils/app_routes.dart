import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recogenie_task/core/di/di.dart';
import 'package:recogenie_task/ui/auth/login/login_view.dart';
import 'package:recogenie_task/ui/main/main_screen.dart';
import 'package:recogenie_task/ui/auth/signup/signup_view.dart';
import 'package:recogenie_task/ui/auth/view_model/auth_cubit.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String main = '/main';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String about = '/about';

  static Map<String, WidgetBuilder> get routes {
    return {
      login: (context) => BlocProvider<AuthCubit>(
            create: (context) => getIt<AuthCubit>(),
            child: const LoginView(),
          ),
      signup: (context) => BlocProvider<AuthCubit>(
            create: (context) => getIt<AuthCubit>(),
            child: const SignupView(),
          ),
      main: (context) => const MainScreen(),
    };
  }
}
