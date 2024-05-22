import 'package:flutter/material.dart';

class SignUpViewModel {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signUp(BuildContext context) async {
   
    Navigator.pushReplacementNamed(context, '/home');
  }
}
