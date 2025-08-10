import 'package:flutter/material.dart';
import 'package:news_app/screens/bookmark/widget/bookmark_header.dart';
import 'package:news_app/widgets/news_card.dart';
import 'package:news_app/widgets/bottom_bar.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookmarkHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
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
                        uuid: '',
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
                        uuid: '',
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
                        uuid: '',
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
                        uuid: '',
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
                        uuid: '',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BottomBar(selectedIcon: "Bookmark"),
          ],
        ),
      ),
    );
  }
}
