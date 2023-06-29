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
                  height: MediaQuery.of(context).size.height * 0.5,
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
                      child: Column(
                        children: [
                          Image.asset(
                            'images/signin-signup_image/hello.png',
                            width: Resize.size(context) * 0.3,
                          ),
                          SizedBox(
                            height: Resize.size(context) * 0.01,
                          ),
                          Text(
                            'Sign in to MIMO ',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: Resize.size(context) * 0.020,
                                color: const Color(0xFF1C4D8C),
                                wordSpacing: 2.0),
                          ),
                          SizedBox(
                            height: Resize.size(context) * 0.02,
                          ),
                          CustomTextFiled(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CircleAvatar(
                                radius: 20,
                                backgroundColor: AppColor.colorButton,
                                child: Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.white,
                                ),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Đăng kí',
                                    style: TextStyle(
                                        fontSize: Resize.size(context) * 0.03,
                                        color: AppColor.colorButton),
                                  )),
                            ],
                          )
                        ],
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
