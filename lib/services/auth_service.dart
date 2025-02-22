import 'package:capricon_flutter_task/constant/api_constant.dart';
import 'package:capricon_flutter_task/constant/string_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user_model.dart';

class AuthService {
  static Future<User> login(String email, String password) async {
    // Use the dynamic URL from ApiConstants
    final url = Uri.parse(ApiConstants.getLoginUrl());

    try {
      // Send HTTP POST request
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'identifier': email.trim(),
          'password': password.trim(),
        }),
      );

      ;

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['user'] == null || data['jwt'] == null) {
          throw Exception(StringConstants.invalidResponseFromService);
        }

        // Create User object
        final user = User(
          id: data['user']['id'].toString(),
          email: data['user']['email'],
          token: data['jwt'],
        );

        // Save token to SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', user.token);

        return user;
      } else {
        final errorData = json.decode(response.body);
        final errorMessage =
            errorData['error']?['message'] ?? StringConstants.loginFailed;
        throw Exception(errorMessage);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<User?> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null) {
      return User(id: '1', email: 'user@example.com', token: token);
    }
    return null;
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}
