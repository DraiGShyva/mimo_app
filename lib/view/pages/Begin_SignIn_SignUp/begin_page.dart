import 'package:mimoapp/view/resource/app_color.dart';
import 'package:flutter/material.dart';
import 'package:mimoapp/view/resource/responsive.dart';

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
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: sortingMethod(
                context,
                [
                  Image.asset(
                    'assets/images/begin_image/begin-logo.png',
                    width: Responsive.size(context) * 0.7,
                  ),
                  Column(
                    children: [
                      button(context, 'ĐĂNG NHẬP', 1, '/sign_in_page'),
                      button(context, 'ĐĂNG KÍ', 0.7, '/sign_up_page'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  sortingMethod(BuildContext context, List<Widget> widget) =>
      Responsive.vertical(context)
          ? Column(
              children: widget,
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget,
            );

  SizedBox button(
      BuildContext context, String name, double size, String routeName) {
    size = Responsive.size(context) * size;
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
