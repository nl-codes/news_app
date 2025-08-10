import 'package:flutter/material.dart';
import 'package:news_app/screens/bookmark/page/bookmark_screen.dart';
import 'package:news_app/screens/post/page/comment_screen.dart';

class DetailFooter extends StatefulWidget {
  const DetailFooter({super.key});

  @override
  State<DetailFooter> createState() => _DetailFooterState();
}

class _DetailFooterState extends State<DetailFooter> {
  bool _isLiked = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
            offset: Offset(0, -0.5),
            blurRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                  },
                  child: Icon(
                    color: Colors.pink,
                    _isLiked ? Icons.favorite : Icons.favorite_outline,
                  ),
                ),
                SizedBox(width: 4),
                Text("24.5K", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CommentScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.message_outlined),
                      SizedBox(width: 4),
                      Text("1K", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookmarkScreen()),
                );
              },
              child: Icon(Icons.bookmark, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
