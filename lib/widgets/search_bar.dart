import 'package:flutter/material.dart';

class SearchingBar extends StatelessWidget {
  const SearchingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          prefixIcon: GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/search/news'),
            child: Icon(Icons.search_outlined),
          ),
          suffixIcon: Icon(Icons.more_vert),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }
}
