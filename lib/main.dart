import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app/bishal/json/get_screen.dart';
import 'package:news_app/bishal/json/post_screen.dart';
import 'package:news_app/repo/auth_repo.dart';
import 'package:news_app/screens/author/page/author_profile.dart';
import 'package:news_app/screens/bookmark/page/bookmark_screen.dart';
import 'package:news_app/screens/explore/page/explore_screen.dart';
import 'package:news_app/screens/forgot_password/page/forgot_password_screen.dart';
import 'package:news_app/screens/home/page/homepage_screen.dart';
import 'package:news_app/screens/landing/page/landing_screen.dart';
import 'package:news_app/screens/login/page/login_screen.dart';
import 'package:news_app/screens/notification/page/notification_screen.dart';
import 'package:news_app/screens/onboarding/page/onboarding_three.dart';
import 'package:news_app/screens/post/page/create/create_news_screen.dart';
import 'package:news_app/screens/post/page/detail.dart';
import 'package:news_app/screens/profile/page/add/profile_form_screen.dart';
import 'package:news_app/screens/profile/page/edit/profile_edit_screen.dart';
import 'package:news_app/screens/profile/page/view/profile_screen.dart';
import 'package:news_app/screens/profile/page/view/profile_setting_screen.dart';
import 'package:news_app/screens/search/page/search_by_news.dart';
import 'package:news_app/screens/search/page/search_by_topics.dart';
import 'package:news_app/screens/search/page/serach_by_author.dart';
import 'package:news_app/screens/signup/page/signup_screen.dart';
import 'package:news_app/screens/trending/page/trending_screen.dart';
import 'package:news_app/states/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('Flutter');
  await Firebase.initializeApp();
  runApp(
    BlocProvider(
      create: (_) => AuthCubit(AuthRepository()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      initialRoute: '/',
      routes: {
        '/': (context) => LandingScreen(),
        '/onboarding': (context) => OnboardingThree(),

        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/forgot-password': (context) => ForgotPasswordScreen(),

        '/home': (context) => HomepageScreen(),
        '/explore': (context) => ExploreScreen(),
        '/bookmark': (context) => BookmarkScreen(),

        '/profile/view': (context) => ProfileScreen(),
        '/profile/new': (context) => ProfileFormScreen(),
        '/profile/edit': (context) => ProfileEditScreen(),
        '/profile/setting': (context) => ProfileSettingScreen(),

        '/author': (context) => AuthorProfileScreen(),
        '/trending': (context) => TrendingScreen(),
        '/notification': (context) => NotificationScreen(),

        '/post/create': (context) => CreateNewsScreen(),
        '/post/view': (context) => DetailScreen(postUuid: ""),

        '/search/author': (context) => SearchByAuthorScreen(),
        '/search/news': (context) => SearchByNewsScreen(),
        '/search/topic': (context) => SearchByTopicsScreen(),

        '/test': (context) => GetScreen(),
        '/test/post': (context) => PostScreen(),
      },
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
