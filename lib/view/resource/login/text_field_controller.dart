import 'package:flutter/material.dart';

class Controller {
  static TextEditingController emailOrPhone = TextEditingController();
  static TextEditingController username = TextEditingController();
  static TextEditingController password = TextEditingController();
  static TextEditingController confirmPassword = TextEditingController();

  static void clearController() {
    emailOrPhone.clear();
    username.clear();
    password.clear();
    confirmPassword.clear();
  }
}
