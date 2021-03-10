import 'package:qwxcomponents/Bloc/BlocImageFullscreenView.dart';
import 'package:qwxcomponents/Bloc/lib/BlocProvider.dart';
import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';

class ImageFullscreenView extends StatelessWidget {
  final Image image;
  final Object tag;
  ImageFullscreenView({required this.image, required this.tag});
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<BlocImageFullscreenView>(context);
    final maxScroll = MediaQuery.of(context).size.height / 4;
    return StreamBuilder<ImageFullscreenViewState>(
      initialData: ImageFullscreenViewState(opacity: 0.85),
      stream: bloc.outState,
      builder: (context, snapshot) => ExtendedImageSlidePage(
        slidePageBackgroundHandler: (_, __) {
          return (Colors.black.withOpacity(snapshot.data!.opacity));
        },
        slideType: SlideType.wholePage,
        onSlidingPage: (state) {
          bloc.inEvents
              .add(ImageFullscreenViewSwipeEvent(state.offset.dy, maxScroll));
        },
        child: ExtendedImage(
          mode: ExtendedImageMode.gesture,
          image: image.image,
          enableSlideOutPage: true,
          heroBuilderForSlidingPage: (_) => Hero(
            child: _,
            tag: tag,
          ),
        ),
        slideAxis: SlideAxis.vertical,
      ),
    );
  }
}
