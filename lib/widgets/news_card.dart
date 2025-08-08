import 'package:flutter/material.dart';
import 'package:news_app/screens/post/page/detail.dart';

class NewsCard extends StatelessWidget {
  final String uuid;
  final String imageUrl;
  final String title;
  final String genre;
  final String time;
  final String accountImage;
  final String accountName;

  const NewsCard({
    required this.imageUrl,
    required this.title,
    required this.genre,
    required this.time,
    required this.accountImage,
    required this.accountName,

    super.key,
    required this.uuid,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailScreen(postUuid: uuid)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                imageUrl,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    "https://i.pinimg.com/736x/78/19/4e/78194e018be444f16f0dd87f4925e746.jpg",
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(genre),
                  SizedBox(height: 5),
                  Text(title, overflow: TextOverflow.ellipsis, maxLines: 2),
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
                          SizedBox(
                            width: 100,
                            child: Text(
                              accountName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.watch_later_outlined,
                            size: 20,
                            color: Colors.grey,
                          ),
                          Text(time, style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      Icon(Icons.more_horiz, size: 20, color: Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
