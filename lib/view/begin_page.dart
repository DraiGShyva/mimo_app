import 'package:mimoapp/view/resource/app_color.dart';
import 'package:flutter/material.dart';
import 'package:mimoapp/view/resource/resize.dart';

class BeginPage extends StatelessWidget {
  static const routeName = '/begin_page';
  const BeginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppColor.colorApp,
        child: Center(
          child: SingleChildScrollView(
            primary: true,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/begin_image/begin-logo.png',
                  width: Resize.size(context) * 0.7,
                ),
                button(context, 'Sign In', 1, '/plash_time_page'),
                button(context, 'Sign Up', 0.7, '/plash_time_page'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox button(
      BuildContext context, String name, double size, String routeName) {
    size = Resize.size(context) * size;
    return SizedBox(
      height: size * 0.2,
      width: size * 0.75,
      child: Stack(
        children: [
          Center(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, routeName);
                },
                borderRadius: BorderRadius.circular(100),
                child: Ink(
                  width: size * 0.6,
                  decoration: BoxDecoration(
                    color: AppColor.colorButton,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: size * 0.04,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            left: size * 0.6,
            child: Image.asset(
              'assets/images/begin_image/begin-icon.png',
            ),
          )
        ],
      ),
    );
  }
}
