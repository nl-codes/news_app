import 'package:flutter/material.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/logo.png'),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/notification'),
          child: Icon(Icons.notifications),
        ),
      ],
    );
  }
}
