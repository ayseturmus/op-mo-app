import 'package:flutter/material.dart';
import 'package:op_mo_app/core/network/graphql_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../welcome/welcome_screen.dart';

class ProfileViewModel {
  final GraphQLService _graphqlService = GraphQLService();
  final ValueNotifier<Map<String, dynamic>?> userDataNotifier =
      ValueNotifier(null);
  String? errorMessage;

  Future<void> fetchUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final authToken = prefs.getString('authToken');

      if (authToken != null) {
        Map<String, dynamic> decodedToken = JwtDecoder.decode(authToken);
        String userId = decodedToken['user_id'];

        final result = await _graphqlService.getUserById(userId);

        if (result.hasException) {
          errorMessage = result.exception.toString();
        } else {
          userDataNotifier.value = result.data?['user'];
        }
      } else {
        errorMessage = 'No auth token found';
      }
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      (Route<dynamic> route) => false,
    );
  }
}
