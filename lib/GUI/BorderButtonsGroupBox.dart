import 'package:flutter/material.dart';
import 'BorderButton.dart';
import 'package:qwxcomponents/qwxcomponents.dart';

///Create a groupbox of _children]
class BorderButtonsGroupBox extends StatelessWidget {
  late final List<AbstractBorderButton> _children;
  BorderButtonsGroupBox({required List<AbstractBorderButton> children}) {
    if (children.length >= 2) {
      children.first.type = BorderButtonType.First;
      for (AbstractBorderButton a
          in children.getRange(1, children.length - 1)) {
        a.type = BorderButtonType.Central;
      }
      children.last.type = BorderButtonType.Last;
    }
    _children = children;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: _children);
  }
}
