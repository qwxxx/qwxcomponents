library lib;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nested/nested.dart';
import 'BlocBase.dart';

class BlocProvider<T extends BlocBase> extends Provider<T> {
  final T bloc;
  final Widget? widget;
  BlocProvider({required this.bloc, this.widget})
      : super(
            create: (_) => bloc,
            dispose: (_, BlocBase val) => val.dispose(),
            child: widget);

  static T of<T extends BlocBase>(BuildContext context) =>
      Provider.of<T>(context);
}

class BlocMultiProvider extends MultiProvider {
  BlocMultiProvider({
    required List<SingleChildWidget> blocProviders,
    required Widget widget,
  }) : super(
          providers: blocProviders,
          child: widget,
        );
}
