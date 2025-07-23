import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/onboarding');
        },
        child: SafeArea(child: Center(child: Image.asset('assets/bleach.png'))),
      ),
    );
  }
}
