import 'package:flutter/material.dart';
import 'package:recogenie_task/config/app_theme.dart';
import 'package:recogenie_task/core/utils/app_routes.dart';
import 'package:recogenie_task/ui/auth/signup/signup_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.signup,
      routes: AppRoutes.routes,
    );
  }
}
