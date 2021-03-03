import 'package:flutter/material.dart';

enum CounterType { WithNumber, WithDot, Splash }

class RedDotCounter extends StatelessWidget {
  final CounterType counterType;
  final int count;
  RedDotCounter({this.counterType = CounterType.Splash, required this.count});
  @override
  Widget build(BuildContext context) {
    String text;
    switch (counterType) {
      case CounterType.Splash:
        text = '';
        break;
      case CounterType.WithDot:
        text = '•';
        break;
      case CounterType.WithNumber:
        text = '$count';
        break;
    }
    return Container(
      padding: EdgeInsets.all(2),
      decoration: new BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(6),
      ),
      constraints: BoxConstraints(
        minWidth: 14,
        minHeight: 14,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 8,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
