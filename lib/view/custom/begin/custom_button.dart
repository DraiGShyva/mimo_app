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
      child: Padding(
        padding: EdgeInsets.all(Resize.size(context) * widget.size * 0.02),
        child: Ink(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 231, 250, 255),
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                color: Color.fromARGB(142, 0, 0, 0),
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, widget.routeName!);
            },
            borderRadius: BorderRadius.circular(100),
            child: Padding(
              padding: EdgeInsets.only(
                left: Resize.size(context) * widget.size * 0.06,
                right: Resize.size(context) * widget.size * 0.06,
                top: Resize.size(context) * widget.size * 0.01,
                bottom: Resize.size(context) * widget.size * 0.01,
              ),
              child: Text(
                widget.name!,
                style: TextStyle(
                  fontSize: Resize.size(context) * widget.size * 0.04,
                  color: const Color.fromARGB(255, 0, 152, 198),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
