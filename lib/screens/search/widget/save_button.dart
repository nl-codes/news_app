import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SaveButton extends StatelessWidget {
  final bool isSaved;
  const SaveButton({required this.isSaved, super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        backgroundColor: isSaved ? Colors.blueAccent : null,
        foregroundColor: isSaved ? Colors.white : Colors.blueAccent,
        textStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        side: BorderSide(color: Colors.blueAccent),
      ),
      child: isSaved
          ? Row(children: [Text("Saved")])
          : Row(children: [Text("Save")]),
    );
  }
}
