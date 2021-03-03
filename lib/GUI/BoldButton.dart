import 'package:flutter/material.dart';
import 'BorderButtonType.dart';

class BoldButton extends StatelessWidget {
  void Function()? onPressed;
  String text;
  Color color;
  BorderButtonType type;
  Color textColor;
  double fontSize;
  BoldButton({
    this.onPressed,
    this.text = "",
    this.color = Colors.white,
    this.type = BorderButtonType.Single,
    this.textColor = Colors.black,
    this.fontSize = 15,
  });
  @override
  Widget build(BuildContext context) {
    /*if (textColor == null)
      textColor = Theme.of(context).textTheme.bodyText1.color??Colors.black;*/
    if (textColor == Colors.black || textColor == Colors.white)
      textColor = Theme.of(context).textTheme.bodyText1?.color ?? textColor;
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: this.fontSize,
          letterSpacing: 1.3,
        ),
      ),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 15),
        minimumSize: Size(1.0, 50.0),
        shape: RoundedRectangleBorder(
          borderRadius: getBorderRadius(type),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
