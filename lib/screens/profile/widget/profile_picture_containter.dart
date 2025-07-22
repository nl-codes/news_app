import 'package:flutter/material.dart';

class ProfilePictureContainter extends StatelessWidget {
  const ProfilePictureContainter({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey.shade300,
          child: Icon(Icons.person, size: 50, color: Colors.white),
        ),

        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blueAccent,
              border: Border.all(color: Colors.white, width: 2),
            ),
            padding: const EdgeInsets.all(6),
            child: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
          ),
        ),
      ],
    );
  }
}
