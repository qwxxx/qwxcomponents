import 'package:flutter/material.dart';

class VCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTap;
  VCard({required this.child, this.padding, this.onTap});

  @override
  Widget build(BuildContext context) {
    if (onTap == null)
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: this.padding ?? EdgeInsets.all(5),
          child: child,
        ),
      );
    else
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: this.padding ?? EdgeInsets.all(5),
            child: child,
          ),
        ),
      );
  }
}
