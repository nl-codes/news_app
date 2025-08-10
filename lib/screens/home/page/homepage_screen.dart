import 'package:flutter/material.dart';
import 'package:news_app/core/model/top_news_api_model.dart';
import 'package:news_app/core/network/news_service.dart';
import 'package:news_app/screens/home/widget/header.dart';
import 'package:news_app/utils/time_ago.dart';
import 'package:news_app/widgets/bottom_bar.dart';
import 'package:news_app/widgets/news_card.dart';
import 'package:news_app/widgets/search_bar.dart';
import 'package:news_app/widgets/large_news_card.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
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
                      isLoading
                          ? Center(child: CircularProgressIndicator())
                          : isError
                          ? Center(child: Text(errMsg ?? ""))
                          : SizedBox(
                              height: 524,
                              child: ListView.builder(
                                itemCount: news?.data?.length ?? 0,
                                itemBuilder: (context, index) {
                                  final item = news!.data![index];
                                  final genre =
                                      item.categories?.isNotEmpty == true
                                      ? item.categories![0].name
                                      : "General";

                                  if (index == 0) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        LargeNewsCard(
                                          uuid: item.uuid ?? "",
                                          imageUrl: item.imageUrl ?? "",
                                          title: item.title ?? "Default",
                                          genre: genre,
                                          time: timeAgo(
                                            item.publishedAt.toString(),
                                          ).toString().split(" ")[0],
                                          accountImage:
                                              'https://i.pinimg.com/736x/78/19/4e/78194e018be444f16f0dd87f4925e746.jpg',
                                          accountName: item.source ?? "my",
                                        ),
                                        const SizedBox(height: 16),
                                        TitleSeeAll(title: "Latest"),
                                        const SizedBox(height: 16),
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
                                        const SizedBox(height: 16),
                                      ],
                                    );
                                  } else {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 16,
                                      ),
                                      child: NewsCard(
                                        uuid: item.uuid ?? "",
                                        imageUrl: item.imageUrl ?? "",
                                        title: item.title ?? "",
                                        genre: genre,
                                        time: timeAgo(
                                          item.publishedAt.toString(),
                                        ).toString(),
                                        accountImage:
                                            'https://i.pinimg.com/736x/78/19/4e/78194e018be444f16f0dd87f4925e746.jpg',
                                        accountName: item.source ?? "",
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
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
