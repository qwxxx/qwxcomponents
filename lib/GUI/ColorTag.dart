import 'package:flutter/material.dart';

class ColorTag extends StatelessWidget {
  final String text;
  final Color? color;
  final double radius;
  final TextStyle? textStyle;
  ColorTag({
    required this.text,
    this.color,
    this.radius = 10,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          text,
          style: textStyle ?? TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
