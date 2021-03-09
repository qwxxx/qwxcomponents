import 'package:flutter/material.dart';

enum BorderButtonType { First, Central, Last, Single }
// ignore: missing_return
BorderRadius getBorderRadius(BorderButtonType type) {
  switch (type) {
    case BorderButtonType.Central:
      return BorderRadius.zero;
    case BorderButtonType.First:
      return BorderRadius.vertical(top: Radius.circular(7.0));
    case BorderButtonType.Last:
      return BorderRadius.vertical(bottom: Radius.circular(7.0));
    case BorderButtonType.Single:
      return BorderRadius.circular(7.0);
  }
}
