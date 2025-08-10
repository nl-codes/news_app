import 'package:flutter/material.dart';
import 'package:news_app/screens/search/widget/save_button.dart';

class TopicCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String genre;
  final bool isSaved;

  const TopicCard({
    required this.imageUrl,
    required this.title,
    required this.genre,
    required this.isSaved,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            imageUrl,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 4),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(genre, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(title, overflow: TextOverflow.ellipsis, maxLines: 2),
            ],
          ),
        ),
        SizedBox(width: 4),
        SaveButton(initiallySaved: isSaved),
      ],
    );
  }
}
