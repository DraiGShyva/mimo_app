import 'package:flutter/material.dart';
import 'package:mimoapp/view/custom/SignIn_SignUp/custom_button.dart';
import 'package:mimoapp/view/custom/SignIn_SignUp/custom_text_field.dart';
import 'package:mimoapp/view/pages/ForgotPassword/confirm_password.dart';
import 'package:mimoapp/view/resource/login/text_field_controller.dart';
import 'package:mimoapp/view/resource/responsive.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  sortingMethod(context, widget) => Responsive.vertical(context)
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
                          height: MediaQuery.of(context).size.height / 3,
                        ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Responsive.size(context) * 0.1,
                        right: Responsive.size(context) * 0.1),
                    child: Container(
                      height: Responsive.ipad(context)
                          ? MediaQuery.of(context).size.height * 0.3
                          : MediaQuery.of(context).size.height * 0.5,
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Quên\nMật Khẩu',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize:
                                                Responsive.size(context) * 0.05,
                                            color: const Color(0xFF1C4D8C),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: const CircleBorder(),
                                          padding: EdgeInsets.all(
                                              Responsive.size(context) * 0.035),
                                        ),
                                        child: const Icon(
                                          Icons.arrow_back_rounded,
                                          color: Colors.white,
                                        ),
                                      ),
                                      CustomButton(
                                        name: 'Xác nhận',
                                        size: 0.5,
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ConfirmPassword(),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
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
        ],
      ),
    );
  }
}
