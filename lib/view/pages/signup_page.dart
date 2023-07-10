import 'package:flutter/material.dart';
import 'package:mimoapp/model/signup_model.dart';

import 'package:mimoapp/view/custom/begin/custom_button.dart';
import 'package:mimoapp/view/custom/begin/custom_text_field.dart';

import 'package:mimoapp/view/resource/login/text_field_controller.dart';
import 'package:mimoapp/view/resource/resize.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/sign_up_page';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  snackBar(IconData icon, String messenge) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.green,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              messenge,
            ),
          ],
        ),
      ),
    );
  }

  signUpSuccess() {
    return Navigator.of(context)
        .pushNamedAndRemoveUntil('/sign_in_page', (route) => false);
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
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: Resize.size(context) * 0.1,
                        right: Resize.size(context) * 0.1),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      padding: EdgeInsets.only(
                          left: Resize.size(context) * 0.05,
                          right: Resize.size(context) * 0.05),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding:
                                EdgeInsets.all(Resize.size(context) * 0.02),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/signin-signup_image/hello.png',
                                        width: Resize.size(context) * 0.4,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image.asset(
                                        'assets/images/signin-signup_image/Sign-up-logo.gif',
                                        width: Resize.size(context) * 0.25,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Resize.size(context) * 0.03,
                                  ),
                                  Text(
                                    'Đăng kí tài khoản MIMO ',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: Resize.size(context) * 0.035,
                                        color: Colors.black,
                                        wordSpacing: 2.0),
                                  ),
                                  SizedBox(
                                    height: Resize.size(context) * 0.02,
                                  ),
                                  CustomTextFiled(
                                    labelText: 'Họ và tên ',
                                    hintText: 'Họ và tên',
                                    controller: Controller.username,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Vui lòng nhập họ và tên';
                                      }
                                      return null;
                                    },
                                  ),
                                  CustomTextFiled(
                                    labelText: 'SĐT hoặc email ',
                                    hintText: 'SĐT hoặc email',
                                    controller: Controller.emailOrPhone,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Vui lòng nhập SĐT hoặc email';
                                      }
                                      return null;
                                    },
                                  ),
                                  CustomTextFiled(
                                    isPassword: true,
                                    labelText: 'Mật khẩu ',
                                    hintText: 'Mật khẩu',
                                    controller: Controller.password,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Vui lòng nhập mật khẩu';
                                      }
                                      return null;
                                    },
                                  ),
                                  CustomTextFiled(
                                    isPassword: true,
                                    labelText: 'Xác nhận mật khẩu ',
                                    hintText: 'Xác nhận mật khẩu',
                                    controller: Controller.confirmPassword,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Vui lòng xác nhận mật khẩu';
                                      } else if (Controller.password.text !=
                                          Controller.confirmPassword.text) {
                                        return 'Mật khẩu không khớp';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: Resize.size(context) * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushNamed('/sign_in_page');
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: const CircleBorder(),
                                          padding: EdgeInsets.all(
                                              Resize.size(context) * 0.035),
                                        ),
                                        child: const Icon(
                                          Icons.arrow_back_rounded,
                                          color: Colors.white,
                                        ),
                                      ),
                                      CustomButton(
                                        name: 'Đăng kí',
                                        size: 0.5,
                                        onPressed: () async {
                                          if (_formKey.currentState != null &&
                                              _formKey.currentState!
                                                  .validate()) {
                                            String isCheck = await SignUpModel()
                                                .signUp(
                                                    Controller.username.text,
                                                    Controller.password.text,
                                                    Controller
                                                        .emailOrPhone.text);

                                            if (isCheck == "5") {
                                              snackBar(
                                                  Icons
                                                      .check_circle_outline_rounded,
                                                  'Đăng kí thành công ');
                                              signUpSuccess();
                                            } else if (isCheck == "1") {
                                              snackBar(Icons.close_rounded,
                                                  'SĐT hoặc email đã tồn tại ');
                                            } else if (isCheck == "2") {
                                              snackBar(Icons.close_rounded,
                                                  'Email không hợp lệ ');
                                            } else if (isCheck == "3") {
                                              snackBar(Icons.close_rounded,
                                                  'SĐT không tồn tại ');
                                            } else if (isCheck == "4") {
                                              snackBar(Icons.close_rounded,
                                                  'SĐT không hợp lệ ');
                                            }
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Resize.size(context) * 0.05,
                                  ),
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
      ),
    );
  }
}
