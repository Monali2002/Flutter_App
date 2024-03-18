import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {

  final String text;
  final TextStyle? textStyle;
  final Color? textColor;

  SmallText({
    required this.text,
    this.textStyle,
    this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle?? TextStyle(
          fontFamily: 'Sora',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: textColor ?? Color(0xff6C7275)
      ),
    );
  }
}