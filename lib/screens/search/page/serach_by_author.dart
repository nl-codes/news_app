import 'package:flutter/material.dart';
import 'package:news_app/screens/search/widget/search_by_option.dart';
import 'package:news_app/screens/search/widget/search_header.dart';
import 'package:news_app/screens/search/widget/search_news_profile.dart';

class SearchByAuthorScreen extends StatelessWidget {
  const SearchByAuthorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            children: [
              SearchHeader(),
              SearchByOption("author"),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SearchNewsProfile(
                        title: "BBC News",
                        imageUrl:
                            "https://images.icon-icons.com/70/PNG/512/bbc_news_14062.png",
                        followers: "1.2M",
                        isFollowed: true,
                      ),
                      SizedBox(height: 40),
                      SearchNewsProfile(
                        title: "CNN",
                        imageUrl:
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/CNN_International_logo.svg/1200px-CNN_International_logo.svg.png",
                        followers: "959K",
                        isFollowed: false,
                      ),
                      SizedBox(height: 40),
                      SearchNewsProfile(
                        title: "Vox",
                        imageUrl:
                            "https://eu-images.contentstack.com/v3/assets/blt8770191dea35bccc/bltc2a61f5ce82ae0a8/64d388e5fd463e814ca44d8f/Vox_20Logo.png?disable=upscale&width=1200&height=630&fit=crop",
                        followers: "452K",
                        isFollowed: true,
                      ),
                      SizedBox(height: 40),
                      SearchNewsProfile(
                        title: "USA Today",
                        imageUrl:
                            "https://brandlogos.net/wp-content/uploads/2022/10/usa_today-logo_brandlogos.net_9jygb.png",
                        followers: "325K",
                        isFollowed: true,
                      ),
                      SizedBox(height: 40),
                      SearchNewsProfile(
                        title: "CNBC",
                        imageUrl:
                            "https://www.newscaststudio.com/wp-content/uploads/2023/12/cnbc-old-logo.jpg",
                        followers: "21K",
                        isFollowed: false,
                      ),
                      SizedBox(height: 40),
                      SearchNewsProfile(
                        title: "CNET",
                        imageUrl:
                            "https://1000logos.net/wp-content/uploads/2023/07/CNET-Logo-1994.png",
                        followers: "18K",
                        isFollowed: false,
                      ),
                      SizedBox(height: 40),
                      SearchNewsProfile(
                        title: "MSN",
                        imageUrl:
                            "https://1000logos.net/wp-content/uploads/2017/04/MSN-Logo.png",
                        followers: "15K",
                        isFollowed: false,
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
