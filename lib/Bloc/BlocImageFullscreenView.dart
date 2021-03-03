import 'package:rxdart/rxdart.dart';
import 'lib/BlocBase.dart';
import 'dart:math';

class ImageFullscreenViewEvent {}

class ImageFullscreenViewInteractionEndEvent extends ImageFullscreenViewEvent {}

class ImageFullscreenViewInteractionStartEvent
    extends ImageFullscreenViewEvent {}

class ImageFullscreenViewInteractionUpdateEvent
    extends ImageFullscreenViewEvent {}

class ImageFullscreenViewSwipeEvent extends ImageFullscreenViewEvent {
  double _num;
  double _max;
  ImageFullscreenViewSwipeEvent(this._num, this._max);
}

class ImageFullscreenViewState {
  double opacity;
  ImageFullscreenViewState({required this.opacity});
}

class ImageFullscreenCloseState extends ImageFullscreenViewState {
  ImageFullscreenCloseState() : super(opacity: 0);
}

class ImageFullscreenZoomState extends ImageFullscreenViewState {
  ImageFullscreenZoomState() : super(opacity: 0);
}

class ImageFullscreenAnimatedReturnState extends ImageFullscreenViewState {
  ImageFullscreenAnimatedReturnState() : super(opacity: 0);
}

class ImageFullscreenSleepState extends ImageFullscreenViewState {
  ImageFullscreenSleepState({required double opacity})
      : super(opacity: opacity);
}

class BlocImageFullscreenView extends BlocBase {
  bool isClosed = false;
  bool isTapped = false;
  ImageFullscreenViewState state = ImageFullscreenSleepState(opacity: 0.85);
  double currentSwipe = 0;

  BehaviorSubject<ImageFullscreenViewState> outState = BehaviorSubject();
  BehaviorSubject<ImageFullscreenViewEvent> inEvents = BehaviorSubject();
  BlocImageFullscreenView() {
    inEvents.listen((event) => handleEvent(event));
  }
  void handleEvent(ImageFullscreenViewEvent event) {
    switch (event.runtimeType) {
      case ImageFullscreenViewInteractionStartEvent:
        break;
      case ImageFullscreenViewInteractionUpdateEvent:
        var updateEvent = event as ImageFullscreenViewInteractionUpdateEvent;
        break;
      case ImageFullscreenViewInteractionEndEvent:
        var endEvent = event as ImageFullscreenViewInteractionEndEvent;
        break;
      case ImageFullscreenViewSwipeEvent:
        var swipe = event as ImageFullscreenViewSwipeEvent;
        currentSwipe = swipe._num;
        var maxSwipe = swipe._max;

        if (currentSwipe > maxSwipe &&
            !isClosed &&
            state.runtimeType == ImageFullscreenSleepState) {
          isClosed = true;
          state = (ImageFullscreenCloseState());
        } else if (currentSwipe.abs() < maxSwipe) {
          state = ImageFullscreenSleepState(
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
