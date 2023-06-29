import 'package:flutter/material.dart';
import 'package:mimoapp/view/resource/app_color.dart';
import 'package:mimoapp/view/resource/resize.dart';

class CustomButton extends StatefulWidget {
  final String? name;
  final double size;
  final String? routeName;
  const CustomButton({
    super.key,
    this.name,
    this.size = 1,
    this.routeName,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, widget.routeName!);
        },
        borderRadius: BorderRadius.circular(100),
        child: Ink(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColor.colorButton,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            widget.name!,
            style: TextStyle(
              fontSize: Resize.size(context) * widget.size * 0.04,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              //fontFamily: 'Caprasimo',
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
