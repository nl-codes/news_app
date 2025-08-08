import 'package:flutter/material.dart';
import 'package:news_app/core/model/single_news_api_model.dart';
import 'package:news_app/core/network/news_service.dart';
import 'package:news_app/screens/bookmark/page/bookmark_screen.dart';
import 'package:news_app/screens/post/page/comment.dart';
import 'package:news_app/screens/post/widget/detail_post_description.dart';
import 'package:news_app/utils/random_words_adder.dart';
import 'package:news_app/utils/time_ago.dart';

class DetailScreen extends StatefulWidget {
  final String postUuid;
  const DetailScreen({super.key, required this.postUuid});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  NewsService apiService = NewsService();
  SingleNewsApiModel? news;

  bool isLoading = false;
  bool isError = false;
  String? errMsg;

  Future<void> getNewsInfo() async {
    setState(() => isLoading = true);

    try {
      final res = await apiService.fetchNewsByUUID(widget.postUuid);

      if (res.statusCode == 200) {
        setState(() {
          news = SingleNewsApiModel.fromJson(res.data);
          isLoading = false;
        });
      } else {
        setState(() {
          isError = true;
          errMsg = "Something went wrong: ${res.toString()}";
          isLoading = false;
        });
      }
      print("Data fetched successfully: ${res.toString()}");
    } catch (e) {
      setState(() {
        isLoading = false;
        isError = true;
        errMsg = "Something went wrong with API: $e";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    print("POST UUID : ${widget.postUuid}");
    if (widget.postUuid.isNotEmpty) {
      getNewsInfo();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isPostDynamic = widget.postUuid.isNotEmpty;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Navbar(),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: isPostDynamic
                      ? isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : isError
                            ? Center(child: Text(errMsg ?? ""))
                            : BodyDescription(
                                imageUrl: news?.imageUrl ?? "",
                                genre: (news?.categories?.isNotEmpty ?? false)
                                    ? news!.categories!.first
                                    : "General",
                                postTitle: news?.title ?? "",
                                postDescription: randomWordsAdder(
                                  news?.description,
                                ),
                                authorImageUrl:
                                    'https://i.pinimg.com/736x/78/19/4e/78194e018be444f16f0dd87f4925e746.jpg',
                                authorTitle: news?.source ?? "",
                                updatedTime: timeAgo(
                                  news?.publishedAt?.toString() ?? "",
                                ).toString().split(' ')[0],
                                isFollowed: true,
                              )
                      : BodyDescription(
                          imageUrl:
                              'https://t4.ftcdn.net/jpg/07/85/99/79/360_F_785997974_bFmPEPwMxgcdBCzfSmd0bZIdcgg3pnaf.jpg',
                          genre: 'Europe',
                          postTitle:
                              "Ukraine's President Zelensky to BBC: Blood money being paid for Russian oil",
                          postDescription:
                              'Ukrainian President Volodymyr Zelensky has accused European countries that continue to buy Russian oil of "earning their money in other people\'s blood".\n\nIn an interview with the BBC, President Zelensky singled out Germany and Hungary, accusing them of blocking efforts to embargo energy sales, from which Russia stands to make up to £250bn (\$326bn) this year.\n\nThere has been a growing frustration among Ukraine\'s leadership with Berlin, which has backed some sanctions against Russia but so far resisted calls to back tougher action on oil sales.',
                          authorImageUrl:
                              'https://images.icon-icons.com/70/PNG/512/bbc_news_14062.png',
                          authorTitle: 'BBC News',
                          updatedTime: '14m',
                          isFollowed: true,
                        ),
                ),
              ),
            ),
            Footer(),
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
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
        Row(
          children: [
            Icon(Icons.share_outlined),
            SizedBox(width: 12),
            Icon(Icons.more_vert),
          ],
        ),
      ],
    );
  }
}

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  bool _isLiked = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
            offset: Offset(0, -0.5),
            blurRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                  },
                  child: Icon(
                    color: Colors.pink,
                    _isLiked ? Icons.favorite : Icons.favorite_outline,
                  ),
                ),
                SizedBox(width: 4),
                Text("24.5K", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CommentScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.message_outlined),
                      SizedBox(width: 4),
                      Text("1K", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookmarkScreen()),
                );
              },
              child: Icon(Icons.bookmark, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
