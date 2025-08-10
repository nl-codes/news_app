import 'package:flutter/material.dart';

class ProfileScreenHeader extends StatelessWidget {
  final String username;
  const ProfileScreenHeader({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.arrow_back, color: Colors.white),
        Text("Profile : $username", style: TextStyle(fontSize: 24)),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/profile/setting'),
          child: Icon(Icons.settings_outlined),
        ),
      ],
    );
  }
}
