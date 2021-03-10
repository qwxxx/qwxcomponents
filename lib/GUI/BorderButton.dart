import 'package:flutter/material.dart';
import 'BorderButtonType.dart';

abstract class AbstractBorderButton extends StatelessWidget {
  late final BorderButtonType type;
}

class BorderButton extends AbstractBorderButton {
  final void Function()? onPressed;
  final String text;
  final Color? color;
  final Color? textColor;
  final double fontSize;
  final bool isBold;
  BorderButton({
    this.onPressed,
    this.text = "",
    this.color,
    this.textColor,
    this.fontSize = 15,
    this.isBold = true,
  });
  @override
  Widget build(BuildContext context) {
    try {
      type.runtimeType;
    } catch (e) {
      type = BorderButtonType.Single;
    }
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: DefaultTextStyle.of(context).style.merge(
              TextStyle(
                color: textColor,
                fontWeight: isBold ? FontWeight.bold : null,
                fontSize: fontSize,
                letterSpacing: isBold ? 1.3 : null,
              ),
            ),
      ),
      style: OutlinedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 15),
        minimumSize: Size(double.infinity, 50.0),
        shape: RoundedRectangleBorder(
          borderRadius: getBorderRadius(type),
        ),
        backgroundColor: color ?? Theme.of(context).cardColor,
      ),
    );
  }
}
