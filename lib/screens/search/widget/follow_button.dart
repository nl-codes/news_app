import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FollowButton extends StatefulWidget {
  final bool isFollowed;
  final ValueChanged<bool>? onFollowChanged; // Optional callback

  const FollowButton({
    this.isFollowed = false,
    this.onFollowChanged,
    super.key,
  });

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  late bool followedStatus;

  @override
  void initState() {
    super.initState();
    followedStatus = widget.isFollowed;
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          followedStatus = !followedStatus;
        });
        // Notify parent widget of the change
        widget.onFollowChanged?.call(followedStatus);
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        backgroundColor: followedStatus ? Colors.blueAccent : null,
        foregroundColor: followedStatus ? Colors.white : Colors.blueAccent,
        textStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        side: const BorderSide(color: Colors.blueAccent),
      ),
      child: followedStatus
          ? const Text("Following")
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.add),
                SizedBox(width: 4),
                Text("Follow"),
              ],
            ),
    );
  }
}
