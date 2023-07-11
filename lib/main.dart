import 'package:flutter/material.dart';
import 'package:mimoapp/view/pages/begin_page.dart';
import 'package:mimoapp/view/pages/bottom_nav_bar.dart';
import 'package:mimoapp/view/pages/signin_page.dart';
import 'package:mimoapp/view/pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    fadePageRoute(Widget page) => PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          // transitionDuration: const Duration(milliseconds: 400),
        );

    return MaterialApp(
      title: 'MIMO FOOD & DRINK',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavBarPage(),
      // routes: {
      //   '/plash_time_page': (context) => const PlashTimePage(),
      //   '/begin_page': (context) => const BeginPage(),
      //   '/sign_in_page': (context) => const SignInPage(),
      //   '/sign_up_page': (context) => const SignUpPage(),
      // },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/begin_page':
            return fadePageRoute(const BeginPage());
          case '/sign_in_page':
            return fadePageRoute(const SignInPage());
          case '/sign_up_page':
            return fadePageRoute(const SignUpPage());
          default:
            return null;
        }
      },
    );
  }
}
