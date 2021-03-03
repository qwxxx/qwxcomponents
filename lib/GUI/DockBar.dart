import 'package:flutter/material.dart';

class DockBar extends StatelessWidget {
  final Function? onAdd;
  final Function(int) onTap;
  final int currentIndex;
  final Color selectedItemColor;
  DockBar(
      {this.onAdd,
      required this.onTap,
      this.currentIndex = 0,
      this.selectedItemColor = Colors.white})
      : super();
  void dispose() {
    print('wow');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: selectedItemColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
            tooltip: "",
            label: ('Новый заказ'),
            icon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            tooltip: "",
            label: ('Общение'),
            icon: Icon(Icons.group),
          ),
          BottomNavigationBarItem(
            tooltip: "",
            label: ('Профиль'),
            icon: Icon(Icons.account_box),
          ),
        ],
      ),
    );
  }
}
