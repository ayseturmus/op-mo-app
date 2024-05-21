import 'package:flutter/material.dart';
import 'register_view_model.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterViewModel _viewModel = RegisterViewModel();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _viewModel.userNameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _viewModel.emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _viewModel.passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _viewModel.register(context),
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
