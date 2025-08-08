import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app/screens/search/widget/topic_card.dart';
import 'package:news_app/widgets/bottom_bar.dart';
import 'package:news_app/widgets/large_news_card.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String username = Hive.box('Flutter').get('username');
    print("data = $username");
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Explore $username",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Topic",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("See all"),
                        ],
                      ),
                      SizedBox(height: 18),
                      TopicCard(
                        imageUrl:
                            "https://media.istockphoto.com/id/508473183/photo/coloful-fruit-cereal-loops.jpg?s=612x612&w=0&k=20&c=I9l-gNz-ZsFzK7AoYY9L0x4DrxigvI1DHiMnKW0_vkc=",
                        title:
                            "View the latest health news and explore the articles on health with our this news app :)",
                        genre: "Health",
                        isSaved: false,
                      ),
                      SizedBox(height: 28),
                      TopicCard(
                        imageUrl:
                            "https://c8.alamy.com/comp/G31ATN/top-view-office-desktop-setup-on-rustic-white-wood-G31ATN.jpg",
                        title:
                            "The latest tech news about the world's best hardware, software, any resources that you can name",
                        genre: "Technology",
                        isSaved: true,
                      ),
                      SizedBox(height: 28),
                      TopicCard(
                        imageUrl:
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0JWmpwWIWaiOLUJE_0c46sKhPwS5MR0HFGA&s",
                        title:
                            "The Art Newspaper is the journla of record for Art the flows all arouond the world",
                        genre: "Art",
                        isSaved: true,
                      ),
                      SizedBox(height: 28),
                      Text(
                        "Popular Topic",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 28),
                      LargeNewsCard(
                        uuid: "",
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
                      LargeNewsCard(
                        uuid: "",
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
                    ],
                  ),
                ),
              ),
            ),
            BottomBar(selectedIcon: "explore"),
          ],
        ),
      ),
    );
  }
}
