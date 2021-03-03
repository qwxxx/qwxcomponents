import 'package:rxdart/rxdart.dart';

import 'BlocVsbLib.dart';

class BlocHomeWidget extends BlocBase {
  int _currentIndex = 0;
  final inIndex = new BehaviorSubject<int>();
  final outIndex = new BehaviorSubject<int>();
  BlocHomeWidget() {
    inIndex.listen((value) {
      _currentIndex = value;
      outIndex.add(_currentIndex);
    });
  }
  @override
  void dispose() {
    print('home dipose');
    inIndex.close();
  }
}
