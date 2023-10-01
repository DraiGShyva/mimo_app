import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mimoapp/model/singin_model.dart';
import 'package:mimoapp/view/custom/signin_signup/custom_button.dart';
import 'package:mimoapp/view/custom/signin_signup/custom_text_field.dart';
import 'package:mimoapp/view/resource/login/text_field_controller.dart';
import 'package:mimoapp/view/resource/responsive.dart';

class SignInPage extends StatelessWidget {
  static const String routeName = '/sign_in_page';

  SignInPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool checkLogin(BuildContext context) {
    if (Controller.emailOrPhone.text.isEmpty ||
        Controller.password.text.isEmpty) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Thông báo'),
            content: const Text(
              'Vui lòng nhập đầy đủ thông tin ',
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return false;
    } else {
      return true;
    }
  }

  signInSuccess(BuildContext context) {
    Navigator.of(context).pushNamed('/bottom_nav_bar_page');
  }

  signInFailed(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thông báo'),
          content: const Text(
            'Mật khẩu hoặc SDT-Email không đúng ',
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  sortingMethod(BuildContext context, List<Widget> widget) =>
      Responsive.vertical(context)
          ? Stack(
              children: widget,
            )
          : Row(
              children: widget,
            );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sortingMethod(
        context,
        [
          Container(
            height: double.infinity,
            width: Responsive.vertical(context)
                ? double.infinity
                : MediaQuery.of(context).size.width * 0.4,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 235, 241, 255),
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/signin-signup_image/background-login.gif'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            color: Responsive.vertical(context)
                ? Colors.transparent
                : const Color.fromARGB(255, 235, 241, 255),
            height: MediaQuery.of(context).size.height,
            width: Responsive.vertical(context)
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width * 0.6,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Responsive.ipad(context)
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height / 2.8,
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height / 10,
                        ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Responsive.size(context) * 0.1,
                        right: Responsive.size(context) * 0.1),
                    child: Container(
                      height: Responsive.ipad(context)
                          ? MediaQuery.of(context).size.height * 0.5
                          : MediaQuery.of(context).size.height * 0.8,
                      padding: EdgeInsets.only(
                          left: Responsive.size(context) * 0.02,
                          right: Responsive.size(context) * 0.02),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 1,
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: Responsive.size(context) * 0.02,
                                left: Responsive.size(context) * 0.02),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Row(children: [
                                    Image.asset(
                                      'assets/images/signin-signup_image/hello.png',
                                      width: Responsive.size(context) * 0.3,
                                    ),
                                  ]),
                                  SizedBox(
                                    height: Responsive.size(context) * 0.01,
                                  ),
                                  Text(
                                    'Sign in to MIMO ',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize:
                                            Responsive.size(context) * 0.025,
                                        color: const Color(0xFF1C4D8C),
                                        wordSpacing: 2.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: Responsive.size(context) * 0.02,
                                  ),
                                  CustomTextFiled(
                                    labelText: 'SĐT hoặc email',
                                    hintText: 'SĐT hoặc email',
                                    controller: Controller.emailOrPhone,
                                  ),
                                  SizedBox(
                                    height: Responsive.size(context) * 0.01,
                                  ),
                                  CustomTextFiled(
                                    isPassword: true,
                                    labelText: 'Mật khẩu ',
                                    hintText: 'Mật khẩu',
                                    controller: Controller.password,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all<
                                                  EdgeInsetsGeometry>(
                                              EdgeInsets.zero),
                                          visualDensity: VisualDensity.compact,
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pushNamed(
                                                '/forgot_password_page');
                                          },
                                          child: Text(
                                            'Quên mật khẩu? ',
                                            style: TextStyle(
                                              fontSize:
                                                  Responsive.size(context) *
                                                      0.025,
                                              color: const Color.fromARGB(
                                                  255, 2, 178, 253),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  CustomButton(
                                    name: 'Đăng nhập',
                                    size: 0.5,
                                    onPressed: () async {
                                      if (checkLogin(context)) {
                                        dynamic checkSignInAPI =
                                            await SignInModel().signIn(
                                                Controller.emailOrPhone.text,
                                                Controller.password.text);
                                        if (checkSignInAPI) {
                                          if (kDebugMode) {
                                            print('Đăng nhập thành công');
                                          }
                                          signInSuccess(context);
                                        } else {
                                          if (kDebugMode) {
                                            print('Đăng nhập thất bại');
                                          }
                                          signInFailed(context);
                                        }
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: Responsive.size(context) * 0.02,
                                  ),
                                  Text(
                                    '-OR-',
                                    style: TextStyle(
                                        fontSize:
                                            Responsive.size(context) * 0.03),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: Responsive.size(context) * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'assets/images/signin-signup_image/logo-facebook.png',
                                          width:
                                              Responsive.size(context) * 0.06),
                                      SizedBox(
                                        width: Responsive.size(context) * 0.04,
                                      ),
                                      Image.asset(
                                          'assets/images/signin-signup_image/logo-google.png',
                                          width:
                                              Responsive.size(context) * 0.06),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Bạn chưa có tài khoản,',
                                        style: TextStyle(
                                            fontSize: Responsive.size(context) *
                                                0.025),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Controller.clearController();
                                          Navigator.of(context)
                                              .pushNamed('/sign_up_page');
                                        },
                                        child: Text('Đăng kí?',
                                            style: TextStyle(
                                              fontSize:
                                                  Responsive.size(context) *
                                                      0.027,
                                              color: const Color.fromARGB(
                                                  255, 2, 178, 253),
                                            )),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
