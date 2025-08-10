import 'package:flutter/material.dart';

class NewsRecentOption extends StatefulWidget {
  final String selectedOption;
  final ValueChanged<String>? onSelectionChanged; // Callback for parent widgets

  const NewsRecentOption({
    this.selectedOption = "News",
    this.onSelectionChanged,
    super.key,
  });

  @override
  State<NewsRecentOption> createState() => _NewsRecentOptionState();
}

class _NewsRecentOptionState extends State<NewsRecentOption> {
  late String selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.selectedOption;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildOption("News"),
            const SizedBox(width: 20),
            _buildOption("Recent"),
          ],
        ),
      ],
    );
  }

  Widget _buildOption(String label) {
    final bool isSelected = selectedOption.toLowerCase() == label.toLowerCase();

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = label;
        });
        widget.onSelectionChanged?.call(label);
      },
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 4),
          if (isSelected)
            Container(height: 3, width: 40, color: Colors.blueAccent),
        ],
      ),
    );
  }
}
