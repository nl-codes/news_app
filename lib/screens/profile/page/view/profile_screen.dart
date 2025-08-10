import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app/core/model/top_news_api_model.dart';
import 'package:news_app/core/network/news_service.dart';
import 'package:news_app/screens/author/widget/author_page_button.dart';
import 'package:news_app/screens/profile/widget/news_recent_option.dart';
import 'package:news_app/screens/profile/widget/profile_description.dart';
import 'package:news_app/screens/profile/widget/profile_screen_header.dart';
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
  var box = Hive.box('Flutter');

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
                          ProfileScreenHeader(username: box.get('username')),
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
                                  height: 264,
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
