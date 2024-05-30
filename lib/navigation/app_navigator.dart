import 'package:flutter/material.dart';
import 'package:op_mo_app/presentation/screens/home/home_screen.dart';
import 'package:op_mo_app/presentation/screens/login/login_screen.dart';
import 'package:op_mo_app/presentation/screens/profile/profile_screen.dart';
import 'package:op_mo_app/presentation/screens/signup/signup_screen.dart'; 
import 'package:op_mo_app/presentation/screens/welcome/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});

  Future<bool> _checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');
    return authToken != null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkAuthStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final bool isAuthenticated = snapshot.data ?? false;

        return MaterialApp(
          title: 'My Flutter Project',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => isAuthenticated ? HomeScreen() : const WelcomeScreen(),
            '/login': (context) => const LoginScreen(),
            '/signup': (context) => SignUpScreen(), 
            '/profile': (context) => const ProfileScreen(),
          },
        );
      },
    );
  }
}
