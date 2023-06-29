import 'package:flutter/material.dart';
import 'package:mimoapp/view/resource/resize.dart';

// ignore: must_be_immutable
class CustomTextFiled extends StatelessWidget {
  String? hintText;
  String? labelText;
  TextInputType? keyboardType;
  bool? obscureText = false;
  TextEditingController? controller;
  CustomTextFiled(
      {super.key,
      this.hintText,
      this.labelText,
      this.obscureText,
      this.keyboardType,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.text,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            label: IntrinsicWidth(
              child: Row(
                children: [
                  Text(
                    labelText!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Resize.size(context) * 0.03,
                    ),
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: Resize.size(context) * 0.05,
                    ),
                  ),
                ],
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: Resize.size(context) * 0.03,
            ),
          ),
        ),
        SizedBox(
          height: Resize.size(context) * 0.02,
        ),
      ],
    );
  }
}
