import 'package:flutter/material.dart';
import 'package:recogenie_task/core/reusable_comp/validator.dart';
import 'package:recogenie_task/core/utils/app_routes.dart';
import 'package:recogenie_task/core/utils/app_strings.dart';
import 'package:recogenie_task/core/utils/config.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void register() {
    if (_formKey.currentState?.validate() ?? false) {}
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Config().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.register),
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
                Text(AppStrings.confirmPassword,
                    style: theme.textTheme.headlineLarge),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: AppStrings.confirmYourPassword,
                  ),
                  validator: (value) => Validator.confirmPassword(
                      value, _passwordController.text),
                  controller: _confirmPasswordController,
                ),
                ElevatedButton(
                  onPressed: () {
                    register();
                  },
                  child: const Text(
                    AppStrings.register,
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
                            context, AppRoutes.login);
                      },
                      child: Text(AppStrings.login,
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
