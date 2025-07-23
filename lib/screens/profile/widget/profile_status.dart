import 'package:flutter/material.dart';

class ProfileStatus extends StatelessWidget {
  const ProfileStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipOval(
          child: Image.network(
            'https://i.pinimg.com/736x/78/19/4e/78194e018be444f16f0dd87f4925e746.jpg',
            height: 100.0,
            width: 100.0,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            Text(
              "1B",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Followers",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "100",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Following",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "1K",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("News", style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
