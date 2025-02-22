// widgets/login_form.dart
import 'package:capricon_flutter_task/constant/app_colors.dart';
import 'package:capricon_flutter_task/constant/string_constant.dart';
import 'package:capricon_flutter_task/constant/text_styles.dart';
import 'package:capricon_flutter_task/controllers/login_controller.dart';
import 'package:capricon_flutter_task/widgets/form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 231, 227, 243),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                StringConstants.welcomeMessage,
                style: TextStyles.welcomeHeadingText,
              ),
              const SizedBox(height: 20),
              EmailField(controller: _emailController),
              const SizedBox(height: 16),
              PasswordField(controller: _passwordController),
              const SizedBox(height: 20),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 10,
                      ),
                    ),
                    onPressed:
                        () => LoginController.handleLogin(
                          context,
                          ref,
                          _formKey,
                          _emailController.text,
                          _passwordController.text,
                          setLoading:
                              (value) => setState(() => _isLoading = value),
                        ),
                    child: const Text(
                      StringConstants.login,
                      style: TextStyles.buttonText,
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
