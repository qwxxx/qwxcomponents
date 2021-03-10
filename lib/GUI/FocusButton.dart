import 'package:flutter/material.dart';

class FocusButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  final double fontSize;
  final Color textColor;
  final Color? backgroundColor;
  FocusButton({
    required this.text,
    this.onPressed,
    this.textColor = Colors.white,
    this.backgroundColor,
    this.fontSize = 15,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: DefaultTextStyle.of(context).style.merge(
              TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: this.fontSize,
                letterSpacing: 1.3,
              ),
            ),
      ),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 15),
        minimumSize: Size(double.infinity, 40.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: backgroundColor ?? Theme.of(context).accentColor,
        primary: Colors.white,
      ),
    );
  }
}
