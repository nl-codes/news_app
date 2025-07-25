import 'package:flutter/material.dart';

class SearchByOption extends StatelessWidget {
  final String selectedOption;
  const SearchByOption(this.selectedOption, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/search/news'),
              child: _buildOption("News"),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/search/topic'),
              child: _buildOption("Topics"),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/search/author'),
              child: _buildOption("Author"),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOption(String label) {
    final bool isSelected = selectedOption.toLowerCase() == label.toLowerCase();

    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.black : Colors.grey[600],
          ),
        ),
        SizedBox(height: 4),
        if (isSelected)
          Container(height: 3, width: 40, color: Colors.blueAccent),
      ],
    );
  }
}
