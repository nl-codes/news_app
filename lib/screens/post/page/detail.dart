import 'package:flutter/material.dart';
import 'package:news_app/screens/post/widget/detail_account_header.dart';
import 'package:news_app/screens/post/widget/detail_post_description.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 20, 20, 0),
              child: Column(
                children: [
                  Navbar(),
                  SizedBox(height: 10),
                  AccountHeader(
                    imageUrl:
                        'https://images.icon-icons.com/70/PNG/512/bbc_news_14062.png',
                    accountTitle: "BBC News",
                    updatedTime: "14m",
                    isFollowed: true,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: BodyDescription(
                    imageUrl:
                        'https://t4.ftcdn.net/jpg/07/85/99/79/360_F_785997974_bFmPEPwMxgcdBCzfSmd0bZIdcgg3pnaf.jpg',
                    genre: 'Europe',
                    postTitle:
                        "Ukraine's President Zelensky to BBC: Blood money being paid for Russian oil",
                    postDescription:
                        'Ukrainian President Volodymyr Zelensky has accusedt European countries that continue to buy Russian oil of "earning their money in other people\'s blood".\n\nIn an interview with the BBC, President Zelensky singled out Germany and Hungary, accusing them of blocking efforts to embargo energy sales, from which Russia stands to make up to £250bn (\$326bn) this year.\n\nThere has been a growing frustration among Ukraine\'s leadership with Berlin, which has backed some sanctions against Russia but so far resisted calls to back tougher action on oil sales.',
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
        Icon(Icons.arrow_back),
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

class Footer extends StatelessWidget {
  const Footer({super.key});

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
                Icon(Icons.favorite, color: Colors.pink),
                SizedBox(width: 4),
                Text("24.5K", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 20),
                Icon(Icons.message_outlined),
                SizedBox(width: 4),
                Text("1K", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Icon(Icons.bookmark, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
