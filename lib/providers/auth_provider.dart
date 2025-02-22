import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

final authProvider = StateNotifierProvider<AuthNotifier, User?>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<User?> {
  AuthNotifier() : super(null);

  Future<void> login(String email, String password) async {
    final user = await AuthService.login(email, password);
    state = user;
  }

  Future<void> autoLogin() async {
    final user = await AuthService.autoLogin();
    state = user;
  }

  Future<void> logout() async {
    await AuthService.logout();
    state = null;
  }
}
