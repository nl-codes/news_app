import 'package:flutter/material.dart';
import 'package:news_app/screens/search/widget/follow_button.dart';

class NotificationFollowing extends StatelessWidget {
  final String imageUrl;
  final String accountName;
  final bool isFollowed;
  final String time;

  const NotificationFollowing({
    super.key,
    required this.imageUrl,
    required this.accountName,
    required this.isFollowed,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(230, 230, 230, 0.5),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: Image.network(
                imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "$accountName ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "is now following you.",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2),
                  Text(time, style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            FollowButton(isFollowed: false),
          ],
        ),
      ),
    );
  }
}
