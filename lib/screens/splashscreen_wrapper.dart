import 'package:flutter/material.dart';
import 'package:fluttertestsocial/models/user.dart';
import 'package:fluttertestsocial/screens/authenticate/authenticate_screen.dart';
import 'package:fluttertestsocial/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class SplashScreenWrapper extends StatelessWidget {
  const SplashScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    if (user == null) {
      return AuthenticateScreen();
    } else {
      return HomeScreen();
    }
  }
}
