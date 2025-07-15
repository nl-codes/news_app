import 'package:flutter/material.dart';

class AuthorProfileScreen extends StatelessWidget {
  const AuthorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Navbar(),
                SizedBox(height: 20),
                AccountStatus(),
                SizedBox(height: 20),
                AccountDescription(),
                SizedBox(height: 20),
                FollowButtons(),
                SizedBox(height: 16),
                NewsCard(),
                SizedBox(height: 16),
                NewsCard(),
                SizedBox(height: 16),
                NewsCard(),
                SizedBox(height: 16),
                NewsCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Icon(Icons.arrow_back), Icon(Icons.more_vert)],
    );
  }
}

class AccountStatus extends StatelessWidget {
  const AccountStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(
          'https://i.redd.it/i-redesigned-bleach-logo-as-a-graphic-designer-hope-you-v0-3mt2mvdsbpqe1.jpg?width=1600&format=pjpg&auto=webp&s=3f8f3988b6cf92a3cd1a26d4011795f040a26d38',
          height: 100.0,
          width: 100.0,
        ),
        Column(
          children: [
            Text("1.2M", style: TextStyle(fontSize: 20)),
            Text(
              "Followers",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        Column(
          children: [
            Text("124K", style: TextStyle(fontSize: 20)),
            Text(
              "Following",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        Column(
          children: [
            Text("326", style: TextStyle(fontSize: 20)),
            Text("News", style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}

class AccountDescription extends StatelessWidget {
  const AccountDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("BBC News", style: TextStyle(fontSize: 20)),
        Text(
          "is an operational business division of the British Broadcasting Corporation responsible for the gathering and broadcasting of news and current affairs.",
        ),
      ],
    );
  }
}

class FollowButtons extends StatelessWidget {
  const FollowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Text("Following"),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Text("Website"),
        ),
      ],
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          'https://images2.alphacoders.com/950/thumb-1920-950350.png',
          width: 90,
          height: 90,
        ),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Europe'),
            SizedBox(height: 5),
            SizedBox(
              width: 200,
              child: Text(
                "Ukraine's President Zelensky to BBC: Blood money being paid as planned by Sosuke Aizen, the leading villian of the Bleach...",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Image.network(
                  'https://images2.alphacoders.com/950/thumb-1920-950350.png',
                  width: 20,
                  height: 20,
                ),
                SizedBox(width: 2),
                Text('BBC News'),
                SizedBox(width: 4),
                Icon(Icons.watch_later_outlined, size: 20),
                Text("14m ago"),
                SizedBox(width: 36),
                Icon(Icons.more_horiz, size: 20),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
