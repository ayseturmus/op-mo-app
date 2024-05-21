import 'package:flutter/material.dart';
import 'package:op_mo_app/core/network/graphql_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home/home_screen.dart';

class LoginViewModel {
  final TextEditingController userNameController =
      TextEditingController(text: 'op_admin');
  final TextEditingController passwordController =
      TextEditingController(text: 'opopopop');
  final GraphQLService _graphqlService = GraphQLService();
  String? errorMessage;
  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
  }

  Future<void> login(BuildContext context) async {
    final userName = userNameController.text;
    final password = passwordController.text;

    final result = await _graphqlService.login(userName, password);

    if (result.hasException) {
      errorMessage = result.exception?.graphqlErrors.first.message;
    } else {
      final authToken = result.data!['login']['AuthenticationToken'];
      final refreshToken = result.data!['login']['RefreshToken'];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('authToken', authToken);
      await prefs.setString('refreshToken', refreshToken);

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (Route<dynamic> route) => false,
      );
    }
  }
}
