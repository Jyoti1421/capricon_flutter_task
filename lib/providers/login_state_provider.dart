
import 'package:capricon_flutter_task/constant/string_constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 1. Create a state notifier to manage login state
class LoginStateNotifier extends StateNotifier<bool> {
  LoginStateNotifier() : super(false) {
    _loadLoginStatus();
  }

  // Method to load login status from SharedPreferences
  Future<void> _loadLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool(StringConstants.isLoggedIn) ?? false; // Default to false if not set
  }

  // Method to set the login state and persist it
  Future<void> setLoginStatus(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(StringConstants.isLoggedIn, isLoggedIn);
    state = isLoggedIn;
  }
}

// 2. Create a provider for the LoginStateNotifier
final loginStateProvider = StateNotifierProvider<LoginStateNotifier, bool>((
  ref,
) {
  return LoginStateNotifier();
});
