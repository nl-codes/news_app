import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SaveButton extends StatefulWidget {
  final bool initiallySaved;
  final ValueChanged<bool>? onSaveChanged;

  const SaveButton({
    this.initiallySaved = false,
    this.onSaveChanged,
    super.key,
  });

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  late bool isSaved;

  @override
  void initState() {
    super.initState();
    isSaved = widget.initiallySaved;
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          isSaved = !isSaved;
        });
        // Notify parent widget of the change
        widget.onSaveChanged?.call(isSaved);
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        backgroundColor: isSaved ? Colors.blueAccent : null,
        foregroundColor: isSaved ? Colors.white : Colors.blueAccent,
        textStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        side: const BorderSide(color: Colors.blueAccent),
      ),
      child: Text(isSaved ? "Saved" : "Save"),
    );
  }
}
