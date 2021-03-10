import 'package:rxdart/rxdart.dart';
import 'lib/BlocBase.dart';

class ImageFullscreenViewEvent {}

class ImageFullscreenViewSwipeEvent extends ImageFullscreenViewEvent {
  double _num;
  double _max;
  ImageFullscreenViewSwipeEvent(this._num, this._max);
}

class ImageFullscreenViewState {
  double opacity;
  ImageFullscreenViewState({required this.opacity});
}

class BlocImageFullscreenView extends BlocBase {
  bool isClosed = false;
  bool isTapped = false;
  ImageFullscreenViewState state = ImageFullscreenViewState(opacity: 0.85);
  double currentSwipe = 0;

  BehaviorSubject<ImageFullscreenViewState> outState = BehaviorSubject();
  BehaviorSubject<ImageFullscreenViewEvent> inEvents = BehaviorSubject();
  BlocImageFullscreenView() {
    inEvents.listen((event) => handleEvent(event));
  }
  void handleEvent(ImageFullscreenViewEvent event) {
    switch (event.runtimeType) {
      case ImageFullscreenViewSwipeEvent:
        var swipe = event as ImageFullscreenViewSwipeEvent;
        currentSwipe = swipe._num;
        var maxSwipe = swipe._max;

        if (currentSwipe.abs() < maxSwipe) {
          state = ImageFullscreenViewState(
              opacity: (0.85 - (currentSwipe.abs()) / maxSwipe * 0.85));
        }
        break;
    }
    outState.add(state);
  }

  @override
  void dispose() {
    inEvents.close();
    outState.close();
  }
}
