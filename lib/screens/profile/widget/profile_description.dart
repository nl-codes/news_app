import 'package:flutter/material.dart';

class ProfileDescription extends StatelessWidget {
  const ProfileDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Nakahara Chuuya", style: TextStyle(fontSize: 20)),
        Text(
          "is a high-ranking executive in the Port Mafia and is known for his short stature, muscular build, and striking orange hair. He is a skilled martial artist and possesses the ability \"For the Tainted Sorrow,\" which allows him to manipulate gravity. He is often depicted as arrogant and prideful, but also fiercely loyal and reliable. ",
        ),
      ],
    );
  }
}
