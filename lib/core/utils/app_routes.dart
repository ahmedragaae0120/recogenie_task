import 'package:flutter/material.dart';
import 'package:recogenie_task/ui/auth/login/login_view.dart';
import 'package:recogenie_task/ui/auth/signup/signup_view.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String about = '/about';

  static Map<String, WidgetBuilder> get routes {
    return {
      login: (context) => const LoginView(),
      signup: (context) => const SignupView(),
    };
  }
}
