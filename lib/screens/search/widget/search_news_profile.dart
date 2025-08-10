import 'package:flutter/material.dart';
import 'package:news_app/screens/search/widget/follow_button.dart';

class SearchNewsProfile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String followers;
  final bool isFollowed;

  const SearchNewsProfile({
    required this.followers,
    required this.imageUrl,
    required this.isFollowed,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/author'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.network(
                  imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("$followers Followers"),
                ],
              ),
            ],
          ),
          FollowButton(isFollowed: isFollowed),
        ],
      ),
    );
  }
}
