import 'package:flutter/material.dart';
import 'package:news_app/core/model/top_news_api_model.dart';
import 'package:news_app/core/network/news_service.dart';
import 'package:news_app/screens/author/widget/author_page_button.dart';
import 'package:news_app/screens/profile/widget/news_recent_option.dart';
import 'package:news_app/screens/profile/widget/profile_description.dart';
import 'package:news_app/screens/profile/widget/profile_status.dart';
import 'package:news_app/utils/time_ago.dart';
import 'package:news_app/widgets/bottom_bar.dart';
import 'package:news_app/widgets/news_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  NewsService apiService = NewsService();
  TopNewsApiModel? news;

  bool isLoading = false;
  bool isError = false;
  String? errMsg;

  void getNewsInfo() async {
    setState(() {
      isLoading = true;
    });
    try {
      final res = await apiService.fetchTopNews();
      setState(() {
        isLoading = false;
      });
      if (res.statusCode == 200) {
        setState(() {
          news = TopNewsApiModel.fromJson(res.data);
        });
      } else {
        setState(() {
          isError = true;
          errMsg = "Something went wrong ${res.toString()}";
        });
      }
      print("Data fetched successfully ${res.toString()}");
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Something went wrong with api : $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getNewsInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Navbar(),
                          SizedBox(height: 10),
                          ProfileStatus(),
                          SizedBox(height: 20),
                          ProfileDescription(),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AuthorPageButton(buttonText: "Following"),
                              AuthorPageButton(buttonText: "Website"),
                            ],
                          ),
                          NewsRecentOption(selectedOption: "recent"),
                          isLoading
                              ? Center(child: CircularProgressIndicator())
                              : isError
                              ? Center(child: Text(errMsg ?? ""))
                              : SizedBox(
                                  height: 300,
                                  child: ListView.builder(
                                    itemCount: news?.data?.length,
                                    itemBuilder: (context, index) {
                                      final item = news!.data![index];
                                      return NewsCard(
                                        uuid: item.uuid ?? "",
                                        imageUrl: item.imageUrl ?? "",
                                        title: item.title ?? "",
                                        genre:
                                            item.categories?.isNotEmpty == true
                                            ? item.categories![0].name
                                            : "General",
                                        time: timeAgo(
                                          item.publishedAt.toString(),
                                        ).toString(),
                                        accountImage:
                                            'https://i.pinimg.com/736x/78/19/4e/78194e018be444f16f0dd87f4925e746.jpg',
                                        accountName: item.source ?? "",
                                      );
                                    },
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 10,
                      child: GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, '/post/create'),
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.blueAccent,
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomBar(selectedIcon: "profile"),
          ],
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
        Icon(Icons.arrow_back, color: Colors.white),
        Text("Profile", style: TextStyle(fontSize: 24)),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/profile/setting'),
          child: Icon(Icons.settings_outlined),
        ),
      ],
    );
  }
}


// Column(
                          //     children: [
                          //       SizedBox(height: 16),

                          //       SizedBox(height: 28),
                          //       NewsCard(
                          //         imageUrl:
                          //             "https://media.cnn.com/api/v1/images/stellar/prod/220412091330-9-chance-encounters-sarah-gostling.jpg?c=original",
                          //         title:
                          //             "Her train broke down. Her phone died. And then she met her Great great grandparents",
                          //         genre: "Travel",
                          //         time: "1h",
                          //         accountImage:
                          //             'https://i.pinimg.com/736x/78/19/4e/78194e018be444f16f0dd87f4925e746.jpg',
                          //         accountName: 'CNN',
                          //       ),
                          //       SizedBox(height: 28),
                          //       NewsCard(
                          //         imageUrl:
                          //             "https://ichef.bbci.co.uk/news/480/cpsprodpb/AF92/production/_124164944_gettyimages-501782322.jpg.webp",
                          //         title:
                          //             "Russia warship: Moskva sinks in Black Sea",
                          //         genre: "Europe",
                          //         time: "4h",
                          //         accountImage:
                          //             'https://i.pinimg.com/736x/78/19/4e/78194e018be444f16f0dd87f4925e746.jpg',
                          //         accountName: 'BBC News',
                          //       ),
                          //       SizedBox(height: 28),
                          //       NewsCard(
                          //         imageUrl:
                          //             "https://static.scientificamerican.com/sciam/cache/file/FC384CF9-1EA0-4E3A-99BE273A24C02688_source.jpg?crop=16%3A9%2Csmart&w=1920",
                          //         title:
                          //             "Wind power produced more electricity than coal and nucturing baby could ever.",
                          //         genre: "Money",
                          //         time: "4h",
                          //         accountImage:
                          //             'https://i.pinimg.com/736x/78/19/4e/78194e018be444f16f0dd87f4925e746.jpg',
                          //         accountName: 'USA Today',
                          //       ),
                          //       SizedBox(height: 28),
                          //       NewsCard(
                          //         imageUrl:
                          //             "https://beautifuloregon.com/wp-content/uploads/2024/02/saint-marys-catholic-church-mount-angel-oregon-photography-101-9232-983-1200x1800.jpg",
                          //         title:
                          //             "'We keep rising to new challenges.' For churches hitler imagined, we forever will. yey",
                          //         genre: "Life",
                          //         time: "4h",
                          //         accountImage:
                          //             'https://i.pinimg.com/736x/78/19/4e/78194e018be444f16f0dd87f4925e746.jpg',
                          //         accountName: 'USA Today',
                          //       ),
                          //     ],
                          //   ),
