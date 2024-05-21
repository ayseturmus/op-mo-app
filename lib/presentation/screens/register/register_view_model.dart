import 'package:flutter/material.dart';

class RegisterViewModel {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> register(BuildContext context) async {
    // Register logic goes here
    // On successful registration, navigate to home screen
    Navigator.pushReplacementNamed(context, '/home');
  }
}
