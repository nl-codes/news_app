import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.arrow_back),
        Text(
          "Fill your Profile",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Icon(Icons.arrow_back, color: Colors.white),
      ],
    );
  }
}
