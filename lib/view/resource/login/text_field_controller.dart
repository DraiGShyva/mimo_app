import 'package:flutter/material.dart';

class Controller {
  static TextEditingController emailOrPhone = TextEditingController();
  // static TextEditingController phoneNumber = TextEditingController();
  static TextEditingController username = TextEditingController();
  static TextEditingController password = TextEditingController();
  static TextEditingController confirmPassword = TextEditingController();

  static void clearController() {
    emailOrPhone.clear();
    //phoneNumber.clear();
    username.clear();
    password.clear();
    confirmPassword.clear();
  }
}
