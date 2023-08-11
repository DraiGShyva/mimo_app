import 'package:flutter/material.dart';
import 'package:mimoapp/view/resource/responsive.dart';

// ignore: must_be_immutable
class CustomTextFiled extends StatefulWidget {
  String? hintText;
  String? labelText;
  TextInputType? keyboardType;
  bool? isPassword = false;
  final Function? validator;
  final Function? onChanged;
  TextEditingController? controller;
  bool hiddenPassword;

  CustomTextFiled({
    super.key,
    this.hintText,
    this.isPassword,
    this.labelText,
    this.keyboardType,
    this.controller,
    this.validator,
    this.onChanged,
  }) : hiddenPassword = isPassword ?? false;

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: widget.validator as String? Function(String?)?,
          onChanged: widget.onChanged as void Function(String)?,
          controller: widget.controller,
          obscureText: widget.hiddenPassword,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: Responsive.size(context) * 0.02,
              horizontal: Responsive.size(context) * 0.02,
            ),
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
                    widget.labelText ?? '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Responsive.size(context) * 0.03,
                    ),
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: Responsive.size(context) * 0.05,
                    ),
                  ),
                ],
              ),
            ),
            hintText: widget.hintText,
            suffixIcon: widget.isPassword ?? false
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        widget.hiddenPassword = !widget.hiddenPassword;
                      });
                    },
                    icon: Icon(
                      widget.hiddenPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      size: Responsive.size(context) * 0.06,
                    ),
                  )
                : null,
            hintStyle: TextStyle(
              fontSize: Responsive.size(context) * 0.03,
            ),
          ),
        ),
        SizedBox(
          height: Responsive.size(context) * 0.02,
        ),
      ],
    );
  }
}
