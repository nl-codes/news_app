import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/screens/author/page/author_profile.dart';
import 'package:news_app/screens/bookmark/page/bookmark_screen.dart';
// import 'package:news_app/screens/bookmark/page/bookmark_screen.dart';
import 'package:news_app/screens/home/page/homepage_screen.dart';
import 'package:news_app/screens/notification/page/notification_screen.dart';
// import 'package:news_app/screens/login/page/login_screen.dart';
import 'package:news_app/screens/onboarding/page/onboarding_three.dart';
import 'package:news_app/screens/profile/page/add/profile_form_screen.dart';
import 'package:news_app/screens/trending/page/trending_screen.dart';
// import 'package:news_app/screens/signup/page/signup_screen.dart';
// import 'package:news_app/screens/author/page/author_profile.dart';
// import 'package:news_app/screens/bookmark/page/bookmark_screen.dart';
// import 'package:news_app/screens/onboarding/page/onboarding_three.dart';
// import 'package:news_app/screens/post/page/comment.dart';
// import 'package:news_app/screens/post/page/detail.dart';
// import 'package:news_app/screens/search/page/serach_by_author.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      initialRoute: '/profile/edit',
      routes: {
        '/': (context) => OnboardingThree(),
        '/home': (context) => HomepageScreen(),
        '/author': (context) => AuthorProfileScreen(),
        '/bookmark': (context) => BookmarkScreen(),
        '/trending': (context) => TrendingScreen(),
        '/notification': (context) => NotificationScreen(),
        '/profile/edit': (context) => ProfileFormScreen(),
      },
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
      ),
      // home: const OnboardingThree(),
    );
  }
}
