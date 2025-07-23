import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateNewsBottombar extends StatelessWidget {
  const CreateNewsBottombar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
            offset: Offset(0, -0.5),
            blurRadius: 4,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Aa",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 16),
                Icon(Icons.format_align_left),
                SizedBox(width: 16),
                Icon(Icons.image_outlined),
                SizedBox(width: 16),
                Icon(Icons.more_horiz),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                textStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              child: Text("Publish"),
            ),
          ],
        ),
      ),
    );
  }
}
