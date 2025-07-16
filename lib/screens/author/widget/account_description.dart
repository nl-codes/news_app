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
          "is an operational business division of the British Broadcasting Corporation responsible for the gathering and broadcasting of news and current affairs.",
        ),
      ],
    );
  }
}
