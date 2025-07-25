import 'package:flutter/material.dart';

class LargeNewsCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String genre;
  final String time;
  final String accountImage;
  final String accountName;

  const LargeNewsCard({
    required this.imageUrl,
    required this.title,
    required this.genre,
    required this.time,
    required this.accountImage,
    required this.accountName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/post/view'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Image.network(imageUrl, fit: BoxFit.cover),
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
