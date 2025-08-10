import 'package:flutter/material.dart';

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
