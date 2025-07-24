import 'package:flutter/material.dart';
import 'package:recogenie_task/core/reusable_comp/validator.dart';
import 'package:recogenie_task/core/utils/app_routes.dart';
import 'package:recogenie_task/core/utils/app_strings.dart';
import 'package:recogenie_task/core/utils/config.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void login() {
    if (_formKey.currentState?.validate() ?? false) {}
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Config().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.login),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 20,
              children: [
                Config.spaceSmall,
                Text(AppStrings.email, style: theme.textTheme.headlineLarge),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: AppStrings.enterYourEmail,
                  ),
                  validator: Validator.email,
                  controller: _emailController,
                ),
                Text(AppStrings.password, style: theme.textTheme.headlineLarge),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: AppStrings.enterYourPassword,
                  ),
                  validator: Validator.password,
                  controller: _passwordController,
                ),
                ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  child: const Text(
                    AppStrings.login,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppStrings.alreadyHaveAnAccount,
                        style: theme.textTheme.bodyMedium),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.signup);
                      },
                      child: Text(AppStrings.register,
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: theme.colorScheme.primary)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
