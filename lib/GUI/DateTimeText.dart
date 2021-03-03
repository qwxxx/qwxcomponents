import 'package:flutter/material.dart';

class DateTimeText extends StatelessWidget {
  DateTime _dateTime;
  Color color;
  DateTimeText(this._dateTime, {this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    Duration difference = DateTime.now().difference(_dateTime);
    String text = '';
    if (difference < Duration(hours: 1)) {
      text += '${difference.inMinutes} минут';
    } else if (difference < Duration(days: 1)) {
      text += '${difference.inHours} часов';
    } else {
      text += '${difference.inDays} дней';
    }
    text += ' назад';
    if (difference < Duration(minutes: 1)) {
      text = 'только что';
    }
    return Text(
      text,
      style: TextStyle(color: this.color),
    );
  }
}
