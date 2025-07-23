import 'package:flutter/material.dart';

class AccountDescription extends StatelessWidget {
  const AccountDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("BBC News", style: TextStyle(fontSize: 20)),
        Text(
          "is the UK's public service broadcaster. It is a publicly funded organization that provides impartial broadcasting services across television, radio, and online platforms.",
        ),
      ],
    );
  }
}
