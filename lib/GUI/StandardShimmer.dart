import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class StandardShimmer extends StatelessWidget {
  final Widget child;
  StandardShimmer({required this.child});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: child,
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!);
  }
}
