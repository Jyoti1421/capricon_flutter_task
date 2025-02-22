import 'package:capricon_flutter_task/constant/routes_constant.dart';
import 'package:capricon_flutter_task/constant/string_constant.dart';
import 'package:capricon_flutter_task/providers/auth_provider.dart';
import 'package:capricon_flutter_task/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// login_controller.dart (Update handleLogin method)
import '../utils/shared_prefs_helper.dart';

class LoginController {
  static Future<void> handleLogin(
    BuildContext context,
    WidgetRef ref,
    GlobalKey<FormState> formKey,
    String email,
    String password, {
    required Function(bool) setLoading,
  }) async {
    if (formKey.currentState!.validate()) {
      setLoading(true);
      try {
        await ref.read(authProvider.notifier).login(email, password);
        await SharedPrefsHelper.setLoggedIn(true); // Save login state
        ToastUtil.showSuccess(StringConstants.loginSuccessful);
        Navigator.pushReplacementNamed(context, Routes.stock);
      } catch (e) {
        ToastUtil.showError('${StringConstants.loginFailed}: ${e.toString()}');
      } finally {
        setLoading(false);
      }
    }
  }
}
