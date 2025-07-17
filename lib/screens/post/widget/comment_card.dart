import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  final String commentor;
  final String commentorProfile;
  final String commentText;
  final bool isSeeMore;
  final bool isLiked;

  const CommentCard({
    this.isLiked = false,
    required this.commentor,
    required this.commentorProfile,
    required this.commentText,
    required this.isSeeMore,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(child: Image.network(commentorProfile, height: 60, width: 60)),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6),
              Text(
                commentor,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 2),
              Text(commentText, maxLines: 2, overflow: TextOverflow.ellipsis),
              SizedBox(height: 6),
              Row(
                children: [
                  Text("4w", style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 8),
                  Row(
                    children: [
                      Icon(
                        isLiked ? Icons.favorite : Icons.favorite_outline,
                        size: 16,
                        color: isLiked ? Colors.pink : Colors.grey,
                      ),

                      Text("125 likes", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(width: 8),
                  Row(
                    children: [
                      Icon(Icons.reply_outlined, color: Colors.grey, size: 16),
                      Text("reply", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              if (isSeeMore) ...[
                SizedBox(height: 8),
                Text(
                  "See more (2)",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
