import 'package:flutter/material.dart';

class Controller {
  static TextEditingController email_or_phone = TextEditingController();
 // static TextEditingController phoneNumber = TextEditingController();
  static TextEditingController username = TextEditingController();
  static TextEditingController password = TextEditingController();
  static TextEditingController confirmPassword = TextEditingController();

  static void clearController() {
    email_or_phone.clear();
    //phoneNumber.clear();
    username.clear();
    password.clear();
    confirmPassword.clear();
  }
}
