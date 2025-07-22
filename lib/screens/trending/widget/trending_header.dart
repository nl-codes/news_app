import 'package:flutter/material.dart';

class TrendingHeader extends StatelessWidget {
  const TrendingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
          Text(
            "Trending",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Icon(Icons.more_vert),
        ],
      ),
    );
  }
}
