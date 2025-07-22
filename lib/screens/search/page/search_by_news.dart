import 'package:flutter/material.dart';
import 'package:news_app/screens/search/widget/follow_button.dart';
import 'package:news_app/screens/search/widget/search_by_option.dart';
import 'package:news_app/widgets/news_card.dart';

class SearchByNews extends StatelessWidget {
  const SearchByNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            children: [
              SearchBar(),
              SearchByOption("news"),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                      SizedBox(height: 28),
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
                      SizedBox(height: 28),
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
                      SizedBox(height: 28),
                      NewsCard(
                        imageUrl:
                            "https://static.scientificamerican.com/sciam/cache/file/FC384CF9-1EA0-4E3A-99BE273A24C02688_source.jpg?crop=16%3A9%2Csmart&w=1920",
                        title:
                            "Wind power produced more electricity than coal and nucturing baby could ever.",
                        genre: "Money",
                        time: "4h",
                        accountImage:
                            'https://brandlogos.net/wp-content/uploads/2022/10/usa_today-logo_brandlogos.net_9jygb.png',
                        accountName: 'USA Today',
                      ),
                      SizedBox(height: 28),
                      NewsCard(
                        imageUrl:
                            "https://beautifuloregon.com/wp-content/uploads/2024/02/saint-marys-catholic-church-mount-angel-oregon-photography-101-9232-983-1200x1800.jpg",
                        title:
                            "'We keep rising to new challenges.' For churches hitler imagined, we forever will. yey",
                        genre: "Life",
                        time: "4h",
                        accountImage:
                            'https://brandlogos.net/wp-content/uploads/2022/10/usa_today-logo_brandlogos.net_9jygb.png',
                        accountName: 'USA Today',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        border: Border.all(width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.search, size: 20),
                SizedBox(width: 10),
                Text("Search ..."),
              ],
            ),
            Icon(Icons.close, size: 20),
          ],
        ),
      ),
    );
  }
}

class NewsProfile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String followers;
  final bool isFollowed;

  const NewsProfile({
    required this.followers,
    required this.imageUrl,
    required this.isFollowed,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
