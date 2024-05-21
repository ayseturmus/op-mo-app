import 'package:flutter/material.dart';
import 'profile_view_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileViewModel _viewModel = ProfileViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ValueListenableBuilder(
        valueListenable: _viewModel.userDataNotifier,
        builder: (context, userData, _) {
          if (userData != null) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('User ID: ${userData['Id']}',
                        style: const TextStyle(fontSize: 18)),
                    Text('Username: ${userData['UserName']}',
                        style: const TextStyle(fontSize: 18)),
                    Text('Email: ${userData['Email']}',
                        style: const TextStyle(fontSize: 18)),
                    Text('Role: ${userData['Role']}',
                        style: const TextStyle(fontSize: 18)),
                    Text('User Type: ${userData['UserType']}',
                        style: const TextStyle(fontSize: 18)),
                    Text('User Status: ${userData['UserStatus']}',
                        style: const TextStyle(fontSize: 18)),
                    Text('First Name: ${userData['UserBase']['FirstName']}',
                        style: const TextStyle(fontSize: 18)),
                    Text('Last Name: ${userData['UserBase']['LastName']}',
                        style: const TextStyle(fontSize: 18)),
                    Text('Tags: ${userData['UserBase']['Tags']}',
                        style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () => _viewModel.logout(context),
                      child: const Text('Logout',
                          style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              ),
            );
          } else if (_viewModel.errorMessage != null) {
            return Center(
              child: Text(_viewModel.errorMessage!,
                  style: const TextStyle(color: Colors.red)),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
