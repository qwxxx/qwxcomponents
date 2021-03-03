import 'package:qwxcomponents/Bloc/BlocImageFullscreenView.dart';
import 'package:qwxcomponents/Bloc/lib/BlocProvider.dart';
import 'package:flutter/material.dart';

class ImageFullscreenView extends StatelessWidget {
  final Image image;
  final ScrollController _controller =
      ScrollController(initialScrollOffset: 0.1);
  final Object tag;
  ImageFullscreenView({required this.image, required this.tag});
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<BlocImageFullscreenView>(context);
    var hero = Hero(
      tag: tag,
      child: image,
    );
    final maxScroll = MediaQuery.of(context).size.height / 4;
    _controller.addListener(() {
      final currentScroll = _controller.position.pixels;
      bloc.inEvents
          .add(ImageFullscreenViewSwipeEvent(currentScroll, maxScroll));
    });
    bloc.outState.listen(
      (val) {
        if (val is ImageFullscreenCloseState) {
          _controller.dispose();
          Navigator.of(context).pop();
        }
      },
    );
    return StreamBuilder<ImageFullscreenViewState>(
      initialData: ImageFullscreenSleepState(opacity: 0.85),
      stream: bloc.outState,
      builder: (context, snapshot) => Container(
        color: Colors.black.withOpacity(snapshot.data!.opacity),
        child: Scaffold(
          backgroundColor: Colors.black.withOpacity(0),
          body: CustomScrollView(
            controller: _controller,
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    hero,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    /*
    
    
    /*var viewer = InteractiveViewer(
      child: hero,
      alignPanAxis: true,
      panEnabled: false,
      scaleEnabled: false,
      minScale: 0.8,
      maxScale: 4,
      transformationController: _transformationController,
      onInteractionUpdate: (_) => print(_.scale),
    );*/
    var viewer = InteractiveViewer(
      onInteractionEnd: (_) {
        bloc.inEvents.add(ImageFullscreenViewInteractionEndEvent(_));
      },
      onInteractionStart: (_) {
        bloc.inEvents.add(ImageFullscreenViewInteractionStartEvent(_));
      },
      onInteractionUpdate: (_) {
        bloc.inEvents.add(ImageFullscreenViewInteractionUpdateEvent(_));
      },
      child: hero,
      minScale: 1,
      maxScale: 4,
      transformationController: _transformationController,
    );
    return StreamBuilder<ImageFullscreenViewState>(
      initialData: ImageFullscreenSleepState(),
      builder: (context, snapshot) {
        Widget widget = Container();
        switch (snapshot.data!.runtimeType) {
          case ImageFullscreenCloseState:
          case ImageFullscreenSleepState:
            widget = CustomScrollView(
              controller: _controller,
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Container(child: viewer, color: Colors.white),
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            );
            break;
          case ImageFullscreenAnimatedReturnState:
            break;
          case ImageFullscreenZoomState:
            widget = CustomScrollView(
              controller: _controller,
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          child: Container(child: viewer, color: Colors.white),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
            break;
        }
        return Scaffold(body: widget);
      },
      stream: bloc.outState.distinct(),
    );

    return Listener(
      onPointerSignal: (pointerSignal) {
        if (pointerSignal is PointerScrollEvent) print('scroll');
      },
      child: GestureDetector(
          // child: viewer,
          //onScaleUpdate: (scale) => print('scale: ${scale.localFocalPoint}'),
          ),
    );
    /*return GestureDetector(
      child: hero,
      onScaleUpdate: (scale) => print('scale: ${scale.localFocalPoint}'),*/
    //onPanUpdate: (pan) => print('pan: ${pan.localPosition}'),
    //onD
    //);
    /*re
   
    turn StreamBuilder<bool>(
      initialData: false,
      builder: (context, snapshot) {
        var widget;
        if (snapshot.data!) {
          widget = Center(child: hero);
        } else
          widget = CustomScrollView(
            controller: _controller,
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: Container(
                            child: InteractiveViewer(
                              boundaryMargin: EdgeInsets.all(80),
                              onInteractionEnd: (_) {
                                _transformationController.value =
                                    Matrix4.identity();
                              },
                              child: hero,
                              alignPanAxis: true,
                              minScale: 0.8,
                              maxScale: 4,
                              transformationController:
                                  _transformationController,
                            ),
                            color: Colors.white),
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        var gesture = GestureDetector(
            onTap: () {
              // bloc.inEvents.add(ImageFullscreenViewTapEvent());
            },
            child: widget);
        return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                gesture,
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: snapshot.data!
                      ? IconButton(
                          //key: Key('2'),
                          icon: Icon(Icons.navigate_before),
                          onPressed: () {
                            //bloc.inEvents.add(ImageFullscreenViewCloseEvent());
                          })
                      : IconButton(
                          //key: Key('3'),
                          icon: Icon(Icons.navigate_before, size: 0),
                          onPressed: null,
                        ),
                ),
              ],
            ));
      },
      stream: bloc.outShowControls,
    );*/
  }*/
    return Container();
  }
}
