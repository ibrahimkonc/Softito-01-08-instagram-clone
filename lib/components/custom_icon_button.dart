import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final double width, height;
  final String icon;
  final Function onPressed;
  const CustomIconButton({
    Key? key,
    required this.width,
    required this.height,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.0, right: 15.0, top: 20.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: GestureDetector(
          onTap: () {
            onPressed();
          },
          child: Image.asset(
            icon,
            width: width,
            height: height,
          ),
        ),
      ),
    );
  }
}
