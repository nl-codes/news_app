import 'package:flutter/material.dart';
import 'package:news_app/screens/post/page/detail_screen.dart';

class LargeNewsCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String genre;
  final String time;
  final String accountImage;
  final String accountName;
  final String uuid;

  const LargeNewsCard({
    required this.imageUrl,
    required this.title,
    required this.genre,
    required this.time,
    required this.accountImage,
    required this.accountName,
    required this.uuid,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailScreen(postUuid: uuid)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    "https://i.pinimg.com/736x/78/19/4e/78194e018be444f16f0dd87f4925e746.jpg",
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                  );
                },
              ),
            ),
          ),

          SizedBox(height: 5),
          Text(genre),
          SizedBox(height: 5),
          Text(title, overflow: TextOverflow.ellipsis, maxLines: 1),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      accountImage,
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 2),
                  Text(
                    accountName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.watch_later_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                  Text("$time ago", style: TextStyle(color: Colors.grey)),
                ],
              ),
              Icon(Icons.more_horiz, size: 20, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}
