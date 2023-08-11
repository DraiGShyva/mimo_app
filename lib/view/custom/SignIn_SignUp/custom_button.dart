import 'package:flutter/material.dart';
import 'package:mimoapp/view/resource/responsive.dart';

class CustomButton extends StatefulWidget {
  final String name;
  final double size;
  final Function onPressed;
  const CustomButton({
    super.key,
    required this.name,
    this.size = 1,
    required this.onPressed,
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
        padding: EdgeInsets.all(Responsive.size(context) * widget.size * 0.02),
        child: Ink(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 231, 250, 255),
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                color: Color.fromARGB(142, 214, 212, 212),
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: InkWell(
            onTap: widget.onPressed as void Function()?,
            borderRadius: BorderRadius.circular(100),
            child: Padding(
              padding: EdgeInsets.only(
                left: Responsive.size(context) * widget.size * 0.1,
                right: Responsive.size(context) * widget.size * 0.1,
                top: Responsive.size(context) * widget.size * 0.04,
                bottom: Responsive.size(context) * widget.size * 0.04,
              ),
              child: Text(
                widget.name,
                style: TextStyle(
                  fontSize: Responsive.size(context) * widget.size * 0.05,
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
