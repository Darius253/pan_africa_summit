import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/home_screens/home_page.dart';
import 'package:pan_african_ai_summit/ui/onboarding_screens/onboarding_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return user == null ? const OnBoardingScreen() : const HomePage();
  }
}
