import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:mimoapp/view/resource/app_color.dart';
import 'package:flutter/material.dart';
import 'package:mimoapp/view/resource/resize.dart';

class PlashTimePage extends StatefulWidget {
  static const routeName = '/plash_time_page';
  const PlashTimePage({super.key});

  @override
  State<PlashTimePage> createState() => _PlashTimePageState();
}

class _PlashTimePageState extends State<PlashTimePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('/begin_page');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppColor.colorApp,
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/plash_image/plash_character.gif',
                width: Resize.size(context) * 0.7,
              ),
              DefaultTextStyle(
                style: TextStyle(
                    fontSize: Resize.size(context) * 0.06,
                    color: const Color(0xFF3F3D56),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Caprasimo'),
                child: AnimatedTextKit(
                  pause: const Duration(seconds: 3),
                  repeatForever: true,
                  animatedTexts: [
                    TyperAnimatedText(
                      'Mimo Food & Drink',
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
