import 'package:flutter/material.dart';

class SearchByAuthorScreen extends StatelessWidget {
  const SearchByAuthorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            children: [
              SearchBar(),
              NewsProfile(),
              NewsProfile(),
              NewsProfile(),
              NewsProfile(),
              NewsProfile(),
              NewsProfile(),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        border: Border.all(width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.search, size: 30),
                SizedBox(width: 10),
                Text('Search ...', style: TextStyle(fontSize: 20)),
              ],
            ),
            Icon(Icons.close),
          ],
        ),
      ),
    );
  }
}

class NewsProfile extends StatelessWidget {
  const NewsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              "https://media.istockphoto.com/id/1409309637/vector/breaking-news-label-banner-isolated-vector-design.jpg?s=612x612&w=0&k=20&c=JoQHezk8t4hw8xXR1_DtTeWELoUzroAevPHo0Lth2Ow=",
              width: 100,
              height: 100,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("BBC News"), Text("1.2M Followers")],
            ),
          ],
        ),
        OutlinedButton(
          onPressed: () {},
          child: Row(
            children: [Text("🫡"), SizedBox(width: 4), Text("Follow")],
          ),
        ),
      ],
    );
  }
}
