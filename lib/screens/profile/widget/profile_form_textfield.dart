import 'package:flutter/material.dart';

class ProfileFormTextfield extends StatelessWidget {
  final String label;
  final bool isRequired;
  final TextEditingController fieldController;
  const ProfileFormTextfield({
    required this.label,
    required this.isRequired,
    required this.fieldController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isRequired
            ? Row(
                children: [
                  Text(label),
                  Text("*", style: TextStyle(color: Colors.red)),
                ],
              )
            : Text(label),
        TextField(
          decoration: InputDecoration(border: OutlineInputBorder()),
          controller: fieldController,
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
