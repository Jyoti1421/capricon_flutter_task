import 'package:capricon_flutter_task/constant/string_constant.dart';
import 'package:capricon_flutter_task/constant/validators.dart';
import 'package:capricon_flutter_task/providers/password_visibility_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  const EmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: StringConstants.email,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        prefixIcon: const Icon(Icons.email),
      ),
      keyboardType: TextInputType.emailAddress,
      autovalidateMode:
          AutovalidateMode.onUserInteraction, // Validate while typing
      validator: Validators.validateEmail,
    );
  }
}

class PasswordField extends ConsumerWidget {
  final TextEditingController controller;
  const PasswordField({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscureText = ref.watch(passwordVisibilityProvider);
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      autovalidateMode:
          AutovalidateMode.onUserInteraction, // Validate only after interaction
      decoration: InputDecoration(
        labelText: StringConstants.password,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed:
              () =>
                  ref.read(passwordVisibilityProvider.notifier).state =
                      !obscureText,
        ),
      ),

      validator: Validators.password,
    );
  }
}
