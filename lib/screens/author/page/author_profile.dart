import 'package:flutter/material.dart';
import 'package:news_app/screens/author/widget/account_description.dart';
import 'package:news_app/screens/author/widget/account_status.dart';
import 'package:news_app/screens/author/widget/follow_button.dart';
import 'package:news_app/screens/author/widget/news_card.dart';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FollowButton(buttonText: "Following"),
                    FollowButton(buttonText: "Website"),
                  ],
                ),
                SizedBox(height: 16),
                NewsCard(
                  imageUrl:
                      "https://images2.alphacoders.com/950/thumb-1920-950350.png",
                  title:
                      "Ukraine's President Zelensky to BBC: Bollod money being paid to the honor of Sosuke Aizen.",
                  genre: "Europe",
                  time: "14m",
                  accountImage:
                      'https://images.icon-icons.com/70/PNG/512/bbc_news_14062.png',
                  accountName: 'BBC News',
                ),
                SizedBox(height: 16),
                NewsCard(
                  imageUrl:
                      "https://images2.alphacoders.com/950/thumb-1920-950350.png",
                  title: "Frankfurt stun Barcelona to reach semi-finals",
                  genre: "Sport",
                  time: "1h",
                  accountImage:
                      'https://images.icon-icons.com/70/PNG/512/bbc_news_14062.png',
                  accountName: 'BBC News',
                ),
                SizedBox(height: 16),
                NewsCard(
                  imageUrl:
                      "https://images2.alphacoders.com/950/thumb-1920-950350.png",
                  title: "Russina warship: Moskva sinks in the Black sea",
                  genre: "Europe",
                  time: "4h",
                  accountImage:
                      'https://images.icon-icons.com/70/PNG/512/bbc_news_14062.png',
                  accountName: 'BBC News',
                ),
                SizedBox(height: 16),
                NewsCard(
                  imageUrl:
                      "https://images2.alphacoders.com/950/thumb-1920-950350.png",
                  title:
                      "What is the world is happening here? God knows. Do I want to do it? Yes. Lesssgoooooo.",
                  genre: "Enthusiasm",
                  time: "2y",
                  accountImage:
                      'https://images.icon-icons.com/70/PNG/512/bbc_news_14062.png',
                  accountName: 'BBC News',
                ),
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
