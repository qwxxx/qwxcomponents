import 'dart:async';
import 'dart:collection';

import 'package:rxdart/rxdart.dart';
import 'BlocVsbLib.dart';
import '../globaldeclarations.dart';

class BlocNotificationsBadge extends BlocBase {
  final dynamic globalState;
  final BehaviorSubject<int> outNotificationsCount = BehaviorSubject();
  StreamSubscription? notiSub;
  BlocNotificationsBadge({required this.globalState}) {
    notiSub = globalState.outNotifications.listen((value) => refresh(value));
  }
  void refresh(UnmodifiableListView notifications) {
    var count = 0;
    notifications.forEach(
      (element) {
        if (element.status == VNotificationStatus.Unreaded) {
          count = 1;
          return;
        }
      },
    );
    outNotificationsCount.add(count);
  }

  @override
  void dispose() {
    outNotificationsCount.close();
    notiSub?.cancel();
  }
}
