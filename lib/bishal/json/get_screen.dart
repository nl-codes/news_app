import 'package:flutter/material.dart';
import 'package:news_app/core/model/top_news_api_model.dart';
import 'package:news_app/core/network/news_service.dart';
import 'package:news_app/screens/author/widget/author_page_button.dart';
import 'package:news_app/screens/profile/widget/news_recent_option.dart';
import 'package:news_app/screens/profile/widget/profile_description.dart';
import 'package:news_app/screens/profile/widget/profile_status.dart';
import 'package:news_app/widgets/bottom_bar.dart';

class GetScreen extends StatefulWidget {
  const GetScreen({super.key});

  @override
  State<GetScreen> createState() => _GetScreenState();
}

class _GetScreenState extends State<GetScreen> {
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
      final res = await apiService.fetchJSONNews();
      setState(() {
        isLoading = false;
      });
      if (res.statusCode == 200) {
        print("success");
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
                              : Text("Data fetched Successfully"),
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

  String timeAgo(String dateTimeStr) {
    final dateTime = DateTime.parse(dateTimeStr).toLocal();
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return 'just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '${weeks}w ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '${months}mo ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '${years}y ago';
    }
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
