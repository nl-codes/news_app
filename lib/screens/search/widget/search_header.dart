import 'package:flutter/material.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key});

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
                Icon(Icons.search, size: 20),
                SizedBox(width: 10),
                Text("Search ..."),
              ],
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/home'),
              child: Icon(Icons.close, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}
