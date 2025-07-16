import 'package:flutter/material.dart';

class BodyDescription extends StatelessWidget {
  final String imageUrl;
  final String genre;
  final String postTitle;
  final String postDescription;
  const BodyDescription({
    super.key,
    required this.imageUrl,
    required this.genre,
    required this.postTitle,
    required this.postDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 250,
          child: Image.network(imageUrl, fit: BoxFit.cover),
        ),
        SizedBox(height: 10),
        Text(genre, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Text(
          postTitle,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(postDescription),
      ],
    );
  }
}
