import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialButton extends StatelessWidget {
  final String platform;
  const SocialButton(this.platform, {super.key});

  @override
  Widget build(BuildContext context) {
    final isFacebook = platform.toLowerCase() == 'facebook';
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white70,
        textStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Row(
        children: [
          isFacebook
              ? Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/2023_Facebook_icon.svg/2048px-2023_Facebook_icon.svg.png',
                  height: 25,
                  width: 25,
                )
              : Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Google_Favicon_2025.svg/250px-Google_Favicon_2025.svg.png',
                  height: 25,
                  width: 25,
                ),
          SizedBox(width: 10),
          Text(
            platform,
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
