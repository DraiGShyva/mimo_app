// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mimoapp/model/signup_model.dart';
import 'package:mimoapp/view/custom/begin/custom_button.dart';
import 'package:mimoapp/view/custom/begin/custom_text_field.dart';
// ignore: unused_import
import 'package:mimoapp/view/resource/app_color.dart';
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
  bool isCheckPassword = false;
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
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height / 2.8,
                  // ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Resize.size(context) * 0.1,
                        right: Resize.size(context) * 0.1),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      padding: EdgeInsets.only(
                          //top: Resize.size(context) * 0.03,
                          // bottom: Resize.size(context) * 0.05,
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
                                    controller: Controller.phoneNumber,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Vui lòng nhập SĐT hoặc email';
                                      }
                                      return null;
                                    },
                                  ),
                                  CustomTextFiled(
                                    obscureText: true,
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
                                    obscureText: true,
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
                                    // hoạt động khi thay đổi giá trị
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
                                            // ignore: no_leading_underscores_for_local_identifiers
                                            bool _isCheckLogin =
                                                await SignUpModel().signUp(
                                                    Controller.username.text,
                                                    Controller.password.text,
                                                    Controller
                                                        .phoneNumber.text);
                                            if (_isCheckLogin) {
                                              Navigator.of(context)
                                                  .pushNamedAndRemoveUntil(
                                                      '/sign_in_page',
                                                      (route) => false);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .check_circle_outline_rounded,
                                                        color: Colors.green,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        'Đăng kí thành công ',
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            } else {
                                              showDialog<void>(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: const Icon(
                                                        Icons
                                                            .error_outline_rounded,
                                                        color: Colors.red),
                                                    content: const Text(
                                                      'Đăng kí thất bại ',
                                                    ),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .labelLarge,
                                                        ),
                                                        child: const Text('OK'),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }
                                          }
                                        },
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: Resize.size(context) * 0.05,
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
      ),
    );
  }
}
