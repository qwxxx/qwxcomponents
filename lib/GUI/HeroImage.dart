import 'package:flutter/material.dart';
import 'package:qwxcomponents/Bloc/BlocImageFullscreenView.dart';
import 'package:qwxcomponents/Bloc/lib/BlocProvider.dart';
import 'VComponents.dart';

class HeroImage extends StatelessWidget {
  final String url;
  final double frameHeight;
  HeroImage({this.url = '', required this.frameHeight});
  @override
  Widget build(BuildContext context) {
    var tag = DateTime.now().microsecondsSinceEpoch;
    return Hero(
      tag: tag,
      child: FrameImage(
        height: frameHeight,
        url: url,
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              opaque: false,
              pageBuilder: (_, __, ___) => BlocProvider(
                bloc: BlocImageFullscreenView(),
                widget:
                    ImageFullscreenView(image: Image.network(url), tag: tag),
              ),
            ),
          );
        },
      ),
    );
  }
}
