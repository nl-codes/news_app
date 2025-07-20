import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

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
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _IconHolder(
              isSelected: false,
              icon: Icons.home_outlined,
              iconName: "Home",
            ),
            _IconHolder(
              isSelected: false,
              icon: Icons.explore_outlined,
              iconName: "Explore",
            ),
            _IconHolder(
              isSelected: true,
              icon: Icons.bookmark,
              iconName: "Bookmark",
            ),
            _IconHolder(
              isSelected: false,
              icon: Icons.person_pin_circle_outlined,
              iconName: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}

class _IconHolder extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String iconName;

  const _IconHolder({
    required this.isSelected,
    required this.icon,
    required this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: isSelected ? Colors.blue : Colors.grey),
        Text(
          iconName,
          style: TextStyle(color: isSelected ? Colors.blue : Colors.grey),
        ),
      ],
    );
  }
}
