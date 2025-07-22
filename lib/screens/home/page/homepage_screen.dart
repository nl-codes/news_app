import 'package:flutter/material.dart';
import 'package:news_app/screens/home/widget/header.dart';
import 'package:news_app/widgets/bottom_bar.dart';
import 'package:news_app/widgets/news_card.dart';
import 'package:news_app/widgets/search_bar.dart';
import 'package:news_app/widgets/large_news_card.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: HomePageHeader(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Column(
                    children: [
                      SearchingBar(),
                      SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/trending');
                        },
                        child: TitleSeeAll(title: "Trending"),
                      ),
                      SizedBox(height: 16),
                      LargeNewsCard(
                        imageUrl:
                            "https://ichef.bbci.co.uk/news/480/cpsprodpb/AF92/production/_124164944_gettyimages-501782322.jpg.webp",
                        title: "Russia warship: Moskva sinks in Black Sea",
                        genre: "Europe",
                        time: "4h",
                        accountImage:
                            'https://images.icon-icons.com/70/PNG/512/bbc_news_14062.png',
                        accountName: 'BBC News',
                      ),
                      SizedBox(height: 16),
                      TitleSeeAll(title: "Latest"),
                      SizedBox(height: 16),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CategoryChip("All"),
                            CategoryChip("Sports"),
                            CategoryChip("Politics"),
                            CategoryChip("Business"),
                            CategoryChip("Health"),
                            CategoryChip("Travel"),
                            CategoryChip("Science"),
                            CategoryChip("Europe"),
                          ],
                        ),
                      ),
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
                        title:
                            "Her train broke down. Her phone died. And then she met her Great great grandparents",
                        genre: "Travel",
                        time: "1h",
                        accountImage:
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/CNN_International_logo.svg/1200px-CNN_International_logo.svg.png',
                        accountName: 'CNN',
                      ),
                      SizedBox(height: 16),
                      NewsCard(
                        imageUrl:
                            "https://ichef.bbci.co.uk/news/480/cpsprodpb/AF92/production/_124164944_gettyimages-501782322.jpg.webp",
                        title: "Russia warship: Moskva sinks in Black Sea",
                        genre: "Europe",
                        time: "4h",
                        accountImage:
                            'https://images.icon-icons.com/70/PNG/512/bbc_news_14062.png',
                        accountName: 'BBC News',
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
            BottomBar(selectedIcon: "home"),
          ],
        ),
      ),
    );
  }
}

class TitleSeeAll extends StatelessWidget {
  final String title;
  const TitleSeeAll({required this.title, super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        Text("See all"),
      ],
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  const CategoryChip(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Text(label),
    );
  }
}
