import 'package:flutter/material.dart';
import 'package:mimoapp/view/custom/begin/custom_button.dart';
import 'package:mimoapp/view/custom/begin/custom_text_field.dart';
import 'package:mimoapp/view/resource/app_color.dart';
import 'package:mimoapp/view/resource/login/text_field_controller.dart';
import 'package:mimoapp/view/resource/resize.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 235, 241, 255),
          image: DecorationImage(
            image:
                AssetImage('images/signin-signup_image/background-login.gif'),
            fit: BoxFit.contain,
          ),
        ),
        child: Material(
          color: Colors.transparent,
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
                      top: Resize.size(context) * 0.03,
                      bottom: Resize.size(context) * 0.05,
                      left: Resize.size(context) * 0.05,
                      right: Resize.size(context) * 0.05),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(Resize.size(context) * 0.02),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Row(children: [
                              Image.asset(
                                'images/signin-signup_image/hello.png',
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
                              validator: (value) => value!.isEmpty
                                  ? 'Vui lòng nhập SĐT hoặc email'
                                  : null,
                              labelText: 'SĐT hoặc email',
                              hintText: 'SĐT hoặc email',
                              controller: Controller.phoneNumber,
                            ),
                            CustomTextFiled(
                              obscureText: true,
                              labelText: 'Mật khẩu ',
                              hintText: 'Mật khẩu',
                              controller: Controller.password,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Quên mật khẩu?',
                                    style: TextStyle(
                                      fontSize: Resize.size(context) * 0.03,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Resize.size(context) * 0.02,
                            ),
                            const CustomButton(
                              name: 'Đăng nhập',
                              size: 0.5,
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
                                    'images/signin-signup_image/logo-facebook.png',
                                    width: Resize.size(context) * 0.06),
                                SizedBox(
                                  width: Resize.size(context) * 0.02,
                                ),
                                Image.asset(
                                    'images/signin-signup_image/logo-google.png',
                                    width: Resize.size(context) * 0.06),
                              ],
                            )
                          ],
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
    );
  }
}

bool checkLogin(String phoneNumber, String password) {
  if (phoneNumber.isEmpty && password.isEmpty) {
    return true;
  } else {
    return false;
  }
}
