import 'package:flutter/material.dart';
import 'home_view_model.dart';

class HomeScreen extends StatelessWidget {
  final HomeViewModel _viewModel = HomeViewModel();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle),
            iconSize: 40.0,
            onPressed: () {
              _viewModel.navigateToProfile(context);
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
