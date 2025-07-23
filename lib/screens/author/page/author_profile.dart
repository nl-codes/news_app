import 'package:flutter/material.dart';
import 'package:news_app/screens/author/widget/account_description.dart';
import 'package:news_app/screens/author/widget/account_status.dart';
import 'package:news_app/screens/author/widget/author_page_button.dart';
import 'package:news_app/screens/profile/widget/news_recent_option.dart';
import 'package:news_app/widgets/news_card.dart';

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
                    AuthorPageButton(buttonText: "Following"),
                    AuthorPageButton(buttonText: "Website"),
                  ],
                ),
                NewsRecentOption(selectedOption: "news"),
                SizedBox(height: 16),
                NewsCard(
                  imageUrl:
                      "https://ichef.bbci.co.uk/news/800/cpsprodpb/15192/production/_124181468_zel3.jpg.webp",
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
                      "https://media.cnn.com/api/v1/images/stellar/prod/220412091330-9-chance-encounters-sarah-gostling.jpg?c=original",
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
                      "https://ichef.bbci.co.uk/news/480/cpsprodpb/AF92/production/_124164944_gettyimages-501782322.jpg.webp",
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
                      "https://static.scientificamerican.com/sciam/cache/file/FC384CF9-1EA0-4E3A-99BE273A24C02688_source.jpg?crop=16%3A9%2Csmart&w=1920",
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
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
        Icon(Icons.more_vert),
      ],
    );
  }
}
