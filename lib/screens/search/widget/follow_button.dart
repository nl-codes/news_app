import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FollowButton extends StatelessWidget {
  final bool isFollowed;
  const FollowButton({required this.isFollowed, super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        backgroundColor: isFollowed ? Colors.blueAccent : null,
        foregroundColor: isFollowed ? Colors.white : Colors.blueAccent,
        textStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        side: BorderSide(color: Colors.blueAccent),
      ),
      child: isFollowed
          ? Row(children: [Text("Following")])
          : Row(
              children: [Icon(Icons.add), SizedBox(width: 4), Text("Follow")],
            ),
    );
  }
}
