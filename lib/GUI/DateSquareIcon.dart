import 'package:flutter/material.dart';

class DateSquareIcon extends StatelessWidget {
  final DateTime dateTime;
  static const Map<int, String> weekdayMap = {
    1: 'Пн',
    2: 'Вт',
    3: 'Ср',
    4: 'Чт',
    5: 'Пт',
    6: 'Сб',
    7: 'Вс'
  };
  final double? size;
  final Color? backgroundColor;
  DateSquareIcon(this.dateTime, {this.size, this.backgroundColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor ?? Colors.white,
      ),
      child: Column(
        children: [
          Text(
            dateTime.day.toString(),
          ),
          Text(
            weekdayMap[dateTime.weekday]!,
          ),
        ],
      ),
      height: size,
      width: size,
    );
  }
}
