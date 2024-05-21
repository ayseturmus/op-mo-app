import 'package:flutter/material.dart';

class HomeViewModel {
  void navigateToProfile(BuildContext context) {
    Navigator.pushNamed(context, '/profile');
  }
}
