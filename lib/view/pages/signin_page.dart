import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mimoapp/model/singin_model.dart';
import 'package:mimoapp/view/custom/begin/custom_button.dart';
import 'package:mimoapp/view/custom/begin/custom_text_field.dart';
import 'package:mimoapp/view/resource/login/text_field_controller.dart';
import 'package:mimoapp/view/resource/resize.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool checkLogin() {
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

  signInSuccess() {
    return Navigator.of(context).pushNamed('/begin_page');
  }

  signInFailed() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 235, 241, 255),
          image: DecorationImage(
            image: AssetImage(
                'assets/images/signin-signup_image/background-login.gif'),
            fit: BoxFit.contain,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.8,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: Resize.size(context) * 0.1,
                      right: Resize.size(context) * 0.1),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.44,
                    padding: EdgeInsets.only(
                        left: Resize.size(context) * 0.02,
                        right: Resize.size(context) * 0.02),
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
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
                              right: Resize.size(context) * 0.02,
                              left: Resize.size(context) * 0.02),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Row(children: [
                                  Image.asset(
                                    'assets/images/signin-signup_image/hello.png',
                                    width: Resize.size(context) * 0.3,
                                  ),
                                ]),
                                SizedBox(
                                  height: Resize.size(context) * 0.01,
                                ),
                                Text(
                                  'Sign in to MIMO ',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: Resize.size(context) * 0.025,
                                      color: const Color(0xFF1C4D8C),
                                      wordSpacing: 2.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: Resize.size(context) * 0.02,
                                ),
                                CustomTextFiled(
                                  labelText: 'SĐT hoặc email',
                                  hintText: 'SĐT hoặc email',
                                  controller: Controller.emailOrPhone,
                                ),
                                SizedBox(
                                  height: Resize.size(context) * 0.01,
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
                                      child: Text(
                                        'Quên mật khẩu? ',
                                        style: TextStyle(
                                          fontSize:
                                              Resize.size(context) * 0.025,
                                          color: const Color.fromARGB(
                                              255, 2, 178, 253),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                CustomButton(
                                  name: 'Đăng nhập',
                                  size: 0.5,
                                  onPressed: () async {
                                    if (checkLogin()) {
                                      dynamic checkSignInAPI =
                                          await SignInModel().signIn(
                                              Controller.emailOrPhone.text,
                                              Controller.password.text);
                                      if (checkSignInAPI) {
                                        if (kDebugMode) {
                                          print('Đăng nhập thành công');
                                        }
                                        signInSuccess();
                                      } else {
                                        if (kDebugMode) {
                                          print('Đăng nhập thất bại');
                                        }
                                        signInFailed();
                                      }
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: Resize.size(context) * 0.02,
                                ),
                                Text(
                                  '-OR-',
                                  style: TextStyle(
                                      fontSize: Resize.size(context) * 0.03),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: Resize.size(context) * 0.02,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        'assets/images/signin-signup_image/logo-facebook.png',
                                        width: Resize.size(context) * 0.06),
                                    SizedBox(
                                      width: Resize.size(context) * 0.04,
                                    ),
                                    Image.asset(
                                        'assets/images/signin-signup_image/logo-google.png',
                                        width: Resize.size(context) * 0.06),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Bạn chưa có tài khoản,',
                                      style: TextStyle(
                                          fontSize:
                                              Resize.size(context) * 0.025),
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
                                                Resize.size(context) * 0.027,
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
      ),
    );
  }
}
