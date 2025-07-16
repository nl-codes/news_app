import 'package:flutter/material.dart';

class AccountStatus extends StatelessWidget {
  const AccountStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipOval(
          child: Image.network(
            'https://images.icon-icons.com/70/PNG/512/bbc_news_14062.png',
            height: 100.0,
            width: 100.0,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            Text(
              "1.2M",
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
              "124K",
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
              "326",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("News", style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
