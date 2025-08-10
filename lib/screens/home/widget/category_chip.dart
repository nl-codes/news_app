import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  const CategoryChip(
    this.label, {
    this.isSelected = false,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
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
              Container(height: 3, width: 48, color: Colors.blueAccent),
          ],
        ),
      ),
    );
  }
}

class CategorySelector extends StatefulWidget {
  final String initialSelection;

  const CategorySelector({this.initialSelection = "All", super.key});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  late String selectedCategory;

  final List<String> categories = [
    "All",
    "Sports",
    "Politics",
    "Business",
    "Health",
    "Travel",
    "Science",
    "Europe",
  ];

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.initialSelection;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories
            .map(
              (category) => CategoryChip(
                category,
                isSelected: selectedCategory == category,
                onTap: () {
                  setState(() {
                    selectedCategory = category;
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
