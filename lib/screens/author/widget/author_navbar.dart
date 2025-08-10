import 'package:flutter/material.dart';

class AuthorNavbar extends StatelessWidget {
  const AuthorNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
        Icon(Icons.more_vert),
      ],
    );
  }
}
