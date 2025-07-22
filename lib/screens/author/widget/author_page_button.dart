import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthorPageButton extends StatelessWidget {
  final String buttonText;
  const AuthorPageButton({required this.buttonText, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        textStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Text(buttonText),
    );
  }
}
