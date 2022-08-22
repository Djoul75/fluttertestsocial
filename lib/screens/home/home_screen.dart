import 'package:flutter/material.dart';
import 'package:fluttertestsocial/services/authentication.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final AuthenticationService _auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text('Water Social'),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
