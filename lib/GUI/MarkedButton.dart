import 'package:flutter/material.dart';
import 'package:qwxcomponents/qwxcomponents.dart';
import 'BorderButton.dart';

enum MarkedButtonInfoType { Important, Unimportant }

///Button with elevated=0 and ability to add Text at right or down
class MarkedButton extends AbstractBorderButton {
  final void Function()? onPressed;
  final Icon icon;
  final String text;
  final Color? color;
  final TextStyle? textStyle;
  final String? textRight;
  final String? textUnder;
  final Color unimportantColor;
  final Color importantColor;
  final Color? underColor;
  final MarkedButtonInfoType importantType;
  MarkedButton(
      {this.onPressed,
      required this.icon,
      this.text = '',
      this.unimportantColor = Colors.grey,
      this.importantColor = Colors.red,
      this.underColor,
      this.color,
      this.textStyle,
      this.textRight,
      this.textUnder,
      this.importantType = MarkedButtonInfoType.Unimportant});

  @override
  Widget build(BuildContext context) {
    try {
      type.runtimeType;
    } catch (e) {
      type = BorderButtonType.Single;
    }
    Widget infoWidgetRight = Spacer();
    Widget infoWidgetUnder = SizedBox();
    switch (importantType) {
      case MarkedButtonInfoType.Important:
        infoWidgetRight = DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            color: importantColor,
          ),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              textRight ?? '',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        );
        infoWidgetRight = ColorTag(
          color: importantColor,
          text: textRight ?? '',
        );
        break;
      case MarkedButtonInfoType.Unimportant:
        infoWidgetRight = Text(
          textRight ?? '',
          style: TextStyle(color: unimportantColor),
        );
        break;
    }
    if (textUnder != null)
      infoWidgetUnder = Text(textUnder!,
          style: TextStyle(color: underColor ?? Theme.of(context).accentColor));
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(icon.icon, color: Theme.of(context).accentColor),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: textStyle ?? DefaultTextStyle.of(context).style,
              ),
              infoWidgetUnder
            ],
          ),
          Spacer(),
          infoWidgetRight,
          Icon(Icons.chevron_right, color: Theme.of(context).accentColor)
        ],
      ),
      style: OutlinedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 15),
        minimumSize: Size(double.infinity, 60.0),
        shape: RoundedRectangleBorder(
          borderRadius: getBorderRadius(super.type),
        ),
        backgroundColor: color ?? Theme.of(context).cardColor,
      ),
    );
  }
}
