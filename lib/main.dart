import 'package:flutter/material.dart';
import 'package:mimoapp/view/begin_page.dart';
import 'package:mimoapp/view/custom/begin/custom_text_field.dart';
import 'package:mimoapp/view/plash_time_page.dart';
import 'package:mimoapp/view/sign_up_page.dart';
import 'package:mimoapp/view/sign_in_page.dart';
import 'package:mimoapp/view/test.dart';

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
        home: const SignUpPage(),
        // home: const Test(),
        routes: {
          '/plash_time_page': (context) => const PlashTimePage(),
          '/begin_page': (context) => const BeginPage(),
          '/sign_in_page': (context) => const SignInPage(),
          '/sign_up_page': (context) => const SignUpPage(),
        });
  }
}
