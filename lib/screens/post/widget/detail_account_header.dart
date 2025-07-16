import 'package:flutter/material.dart';
import 'package:news_app/screens/search/widget/follow_button.dart';

class AccountHeader extends StatelessWidget {
  final String imageUrl;
  final String accountTitle;
  final String updatedTime;
  final bool isFollowed;
  const AccountHeader({
    required this.imageUrl,
    required this.accountTitle,
    required this.updatedTime,
    required this.isFollowed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.network(imageUrl, height: 50, width: 50),
            SizedBox(width: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  accountTitle,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("$updatedTime ago"),
              ],
            ),
          ],
        ),
        FollowButton(isFollowed: isFollowed),
      ],
    );
  }
}
