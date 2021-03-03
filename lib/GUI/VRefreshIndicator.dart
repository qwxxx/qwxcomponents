import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class VRefreshIndicator extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final Widget child;
  VRefreshIndicator({required this.onRefresh, required this.child});
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: child,
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
