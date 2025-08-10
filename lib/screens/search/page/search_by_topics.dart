import 'package:flutter/material.dart';
import 'package:news_app/screens/search/widget/search_by_option.dart';
import 'package:news_app/screens/search/widget/search_header.dart';
import 'package:news_app/screens/search/widget/topic_card.dart';

class SearchByTopicsScreen extends StatelessWidget {
  const SearchByTopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 0.0),
          child: Column(
            children: [
              SearchHeader(),
              SearchByOption("topics"),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                      TopicCard(
                        imageUrl:
                            "https://i.pinimg.com/564x/ef/98/fd/ef98fdf361bf1e655860d162fb1a1e8a.jpg",
                        title: "Opinion and analysis of Global plolitics",
                        genre: "Politics",
                        isSaved: false,
                      ),
                      SizedBox(height: 28),
                      TopicCard(
                        imageUrl:
                            "https://i.pinimg.com/564x/bb/c0/85/bbc08566f5850a684a6c1d29155d9b9f.jpg",
                        title:
                            "Sports news and live sports coverage including scores, highlights, technical stuffs.",
                        genre: "Sport",
                        isSaved: false,
                      ),
                      SizedBox(height: 28),
                      TopicCard(
                        imageUrl:
                            "https://www.huntermoss.com/images/best-cars-for-road-trips/g-img.webp",
                        title:
                            "The latest travel news on the most significal development platform you can name",
                        genre: "Travel",
                        isSaved: true,
                      ),
                      SizedBox(height: 28),
                      TopicCard(
                        imageUrl:
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3qNivQdfg00KlJYCgyyYKUTLDUH_BSHO4Pg&s",
                        title:
                            "The latest breaking financial news on the US and world at the best possible speed.",
                        genre: "Money",
                        isSaved: true,
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
