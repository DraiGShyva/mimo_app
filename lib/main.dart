import 'package:bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:mimoapp/view/pages/begin_page.dart';
import 'package:mimoapp/view/pages/bottom_nav_bar.dart';
import 'package:mimoapp/view/pages/plash_time_page.dart';
import 'package:mimoapp/view/pages/sign_in_page.dart';
import 'package:mimoapp/view/pages/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MIMO FOOD & DRINK',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BottomNavBarPage(),
        // home: const Test(),
        routes: {
          '/plash_time_page': (context) => const PlashTimePage(),
          '/begin_page': (context) => const BeginPage(),
          '/sign_in_page': (context) => const SignInPage(),
          '/sign_up_page': (context) => const SignUpPage(),
        });
  }
}
