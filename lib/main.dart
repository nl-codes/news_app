import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/screens/author/page/author_profile.dart';
import 'package:news_app/screens/login/page/login_screen.dart';
import 'package:news_app/screens/onboarding/page/onboarding_three.dart';
import 'package:news_app/screens/post/page/comment.dart';
import 'package:news_app/screens/post/page/detail.dart';
import 'package:news_app/screens/search/page/serach_by_author.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SearchByAuthorScreen(),
    );
  }
}
