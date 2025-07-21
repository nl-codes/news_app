import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final String selectedIcon;
  const BottomBar({required this.selectedIcon, super.key});

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
              isSelected: selectedIcon.toLowerCase() == "home" ? true : false,
              icon: selectedIcon.toLowerCase() == "home"
                  ? Icons.home
                  : Icons.home_outlined,
              iconName: "Home",
            ),
            _IconHolder(
              isSelected: selectedIcon.toLowerCase() == "explore"
                  ? true
                  : false,
              icon: selectedIcon.toLowerCase() == "explore"
                  ? Icons.explore
                  : Icons.explore_outlined,
              iconName: "Explore",
            ),
            _IconHolder(
              isSelected: selectedIcon.toLowerCase() == "bookmark"
                  ? true
                  : false,
              icon: selectedIcon.toLowerCase() == "bookmark"
                  ? Icons.bookmark
                  : Icons.bookmark_outline,
              iconName: "Bookmark",
            ),
            _IconHolder(
              isSelected: selectedIcon.toLowerCase() == "profile"
                  ? true
                  : false,
              icon: selectedIcon.toLowerCase() == "profile"
                  ? Icons.person_pin
                  : Icons.person_pin_circle_outlined,
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
