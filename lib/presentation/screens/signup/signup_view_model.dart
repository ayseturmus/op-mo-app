import 'package:flutter/material.dart';

class SignUpViewModel {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Signup logic goes here
  // On successful registration, navigate to home screen
  Future<void> signUp(BuildContext context) async {
   
    Navigator.pushReplacementNamed(context, '/home');
  }
}
