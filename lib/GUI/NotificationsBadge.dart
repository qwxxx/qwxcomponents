import 'package:qwxcomponents/Bloc/BlocNotificationsBadge.dart';
import 'package:qwxcomponents/Bloc/BlocVsbLib.dart';
import 'package:flutter/material.dart';
import 'package:qwxcomponents/GUI/RedDotCounter.dart';

import '../Bloc/BlocNotificationsBadge.dart';
import '../Bloc/BlocVsbLib.dart';

class NotificationsBadge extends StatelessWidget {
  final dynamic globalState;
  final void Function()? onPressed;
  NotificationsBadge({required this.globalState, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: BlocNotificationsBadge(
        globalState: globalState,
      ),
      widget: _NotificationsBadge(
        onPressed: onPressed,
      ),
    );
  }
}

class _NotificationsBadge extends StatelessWidget {
  final void Function()? onPressed;
  _NotificationsBadge({this.onPressed});
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<BlocNotificationsBadge>(context);
    var iconButton = IconButton(
        icon: Icon(
          Icons.notifications,
        ),
        onPressed: onPressed);
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        iconButton,
        StreamBuilder<int>(
            initialData: 0,
            stream: bloc.outNotificationsCount,
            builder: (context, snapshot) {
              if ((snapshot.data!) == 0)
                return Container();
              else
                return Positioned(
                    right: 6,
                    top: 15,
                    child: RedDotCounter(
                      counterType: CounterType.WithDot,
                      count: snapshot.data!,
                    ));
              ;
            }),
      ],
    );
  }
}
