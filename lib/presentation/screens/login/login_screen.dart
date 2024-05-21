import 'package:flutter/material.dart';
import 'login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel _viewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
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
              controller: _viewModel.passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _viewModel.isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _viewModel.togglePasswordVisibility();
                    });
                  },
                ),
              ),
              obscureText: !_viewModel.isPasswordVisible,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _viewModel.login(context),
              child: const Text('Login'),
            ),
            if (_viewModel.errorMessage != null)
              Text(
                _viewModel.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
