import 'package:flutter/material.dart';
import 'package:news_app/widgets/search_bar.dart';

class BookmarkHeader extends StatelessWidget {
  const BookmarkHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 24, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bookmark",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
          ),
          SearchingBar(),
        ],
      ),
    );
  }
}
