import 'package:flutter/material.dart';
import 'package:news_app/screens/post/widget/comment_card.dart';

class ReplyCard extends StatelessWidget {
  final String commentor;
  final String commentorProfile;
  final String commentText;
  final bool isSeeMore;
  final bool isLiked;
  const ReplyCard({
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
        SizedBox(width: 70),
        Expanded(
          child: CommentCard(
            commentorProfile: commentorProfile,
            commentText: commentText,
            commentor: commentor,
            isSeeMore: isSeeMore,
            isLiked: isLiked,
          ),
        ),
      ],
    );
  }
}
