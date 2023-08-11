import 'package:flutter/material.dart';
import 'package:mimoapp/view/pages/Begin_SignIn_SignUp/begin_page.dart';
import 'package:mimoapp/view/pages/Home/bottom_nav_bar.dart';
import 'package:mimoapp/view/pages/ForgotPassword/forgot_password.dart';
import 'package:mimoapp/view/pages/Begin_SignIn_SignUp/plash_time_page.dart';
import 'package:mimoapp/view/pages/product_type_page.dart';
import 'package:mimoapp/view/pages/Begin_SignIn_SignUp/signin_page.dart';
import 'package:mimoapp/view/pages/Begin_SignIn_SignUp/signup_page.dart';
import 'package:mimoapp/view/pages/cart/cart.dart';

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

    return SafeArea(
      child: MaterialApp(
        title: 'MIMO FOOD & DRINK',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Cart(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/begin_page':
              return fadePageRoute(const BeginPage());
            case '/sign_in_page':
              return fadePageRoute(SignInPage());
            case '/sign_up_page':
              return fadePageRoute(SignUpPage());
            case '/forgot_password_page':
              return fadePageRoute(ForgotPassword());
            case '/bottom_nav_bar_page':
              return fadePageRoute(const BottomNavBarPage());
            case '/product_type_page':
              return fadePageRoute(const ProductTypePage());
            case '/cart_page':
              return fadePageRoute(const Cart());
            default:
              return fadePageRoute(const PlashTimePage());
          }
        },
      ),
    );
  }
}
