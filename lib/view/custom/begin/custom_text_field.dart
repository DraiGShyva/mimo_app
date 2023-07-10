import 'package:flutter/material.dart';
import 'package:mimoapp/view/resource/resize.dart';

// ignore: must_be_immutable
class CustomTextFiled extends StatefulWidget {
  String? hintText;
  String? labelText;
  TextInputType? keyboardType;
  bool? isPassword = false;
  final Function? validator;
  final Function? onChanged;
  TextEditingController? controller;
  CustomTextFiled({
    super.key,
    this.hintText,
    this.isPassword,
    this.labelText,
    this.keyboardType,
    this.controller,
    this.validator,
    this.onChanged,
  });

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  // bool hiddenPassword = false;
  @override
  Widget build(BuildContext context) {
    bool hiddenPassword = widget.isPassword ?? false;
    return Column(
      children: [
        TextFormField(
          validator: widget.validator as String? Function(String?)?,
          onChanged: widget.onChanged as void Function(String)?,
          controller: widget.controller,
          obscureText: hiddenPassword,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: Resize.size(context) * 0.02,
              horizontal: Resize.size(context) * 0.02,
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
            hintText: widget.hintText,
            suffixIcon: widget.isPassword ?? false
                ? IconButton(
                    onPressed: () {
                      print(hiddenPassword);
                      setState(() {
                        hiddenPassword = !hiddenPassword;
                        print(hiddenPassword);
                      });
                    },
                    icon: Icon(
                      hiddenPassword ? Icons.visibility_off : Icons.visibility,
                      // Icons.visibility,
                      color: Colors.black,
                    ),
                  )
                : null,
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
