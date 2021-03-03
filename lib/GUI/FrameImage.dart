import 'package:flutter/material.dart';
import 'StandardShimmer.dart';

class FrameImage extends StatelessWidget {
  final String url;
  final void Function()? onTap;
  final double height;
  final BoxFit? fit;
  FrameImage({required this.url, this.onTap, required this.height, this.fit});
  @override
  Widget build(BuildContext context) {
    var a = Image.network(
      this.url,
      fit: fit,
      width: double.infinity,
      height: height,
      errorBuilder: (context, exception, stacktrace) {
        return StandardShimmer(
          child: Container(
            child: Container(
              height: 400,
            ),
            color: Colors.white,
          ),
        );
      },
      frameBuilder: (BuildContext context, Widget child, int? frame,
          bool? wasSynchronouslyLoaded) {
        if (frame != null) {
          return child;
        } else
          return StandardShimmer(
            child: Container(
              child: child,
              color: Colors.white,
            ),
          );
      },
    );
    return GestureDetector(
      child: a,
      onTap: this.onTap,
    );
  }
}
