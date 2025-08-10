import 'package:flutter/material.dart';

class DetailNavbar extends StatelessWidget {
  const DetailNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
        Row(
          children: [
            Icon(Icons.share_outlined),
            SizedBox(width: 12),
            Icon(Icons.more_vert),
          ],
        ),
      ],
    );
  }
}
